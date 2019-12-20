from django.shortcuts import render, redirect, get_object_or_404
from orders.models import Order
from MyShop import braintree_keys
from braintree import Configuration, Environment
import braintree
from django.views.generic import View

from django.template.loader import render_to_string
from django.core.mail import EmailMessage
from django.conf import settings
import weasyprint
from io import BytesIO


Configuration.configure(
    Environment.Sandbox,
    braintree_keys.BRAINTREE_MERCHANT_ID,
    braintree_keys.BRAINTREE_PUBLIC_KEY,
    braintree_keys.BRAINTREE_PRIVATE_KEY
)

# Create your views here.

class PaymentProcess(View):

    def post(self, request):
        order_id = request.session.get('order_id')
        order = get_object_or_404(Order, id=order_id)

        # Получение токена для создания транзакции.
        nonce = request.POST.get('payment_method_nonce', None)

        # Создание и сохранение транзакции
        result = braintree.Transaction.sale({
            'amount': f':{order.get_total_cost()}',
            'payment_method_nonce': nonce,
            'options': {'submit_for_settlement': True}
        })

        if result.is_success:
            # Отметка заказа как оплаченного
            order.paid = True

            # Сохранение ID транзакции в заказе
            order.braintree_id = result.transaction.id
            order.save()
            # Создание электронного сообщения.
            subject = f'My Shop - Invoice no. {order.id}'
            message = 'attached the invoice for your recent purchase.'
            email = EmailMessage(subject, message, settings.EMAIL_HOST_USER, [order.email])

            # Формирование PDF
            html = render_to_string('orders/order/pdf.html', {'order': order})
            out = BytesIO()
            stylesheets = [weasyprint.CSS('static\\' + 'css/pdf.css')]
            weasyprint.HTML(string=html).write_pdf(out, stylesheets=stylesheets)
            email.attach(f'order_{order.id}.pdf', out.getvalue(), 'application/pdf')

            # Отправка сообщения.
            email.send()

            return redirect('payment:done')
        else:
            return redirect('payment:canceled')

    def get(self, request):
        client_token = braintree.ClientToken.generate()
        return render(request, 'payment/process.html', {'client_token': client_token})


class PaymentDone(View):
    def get(self, request):
        return render(request, 'payment/done.html')


class PaymentCanceled(View):
    def get(self, request):
        return render(request, 'payment/canceled.html')


