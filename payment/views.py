from django.shortcuts import render, redirect, get_object_or_404
from orders.models import Order
from MyShop import braintree_keys
from braintree import Configuration, Environment
import braintree
from django.views.generic import View

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


