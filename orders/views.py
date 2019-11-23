from django.shortcuts import render, redirect
from .models import OrderItem
from .forms import OrderCreateForm
from cart.cart import Cart
from .tasks import order_created
from django.urls import reverse



# Create your views here.

def order_create(request):
    cart = Cart(request)
    if request.method == 'POST':
        form = OrderCreateForm(request.POST)
        if form.is_valid():
            order = form.save()
            for item in cart:
                OrderItem.objects.create(
                    order=order,
                    product=item['product'],
                    price=item['price'],
                    quantity=item['quantity'])

            # Очищаем корзину
            cart.clean()
            order_created.delay(order.id)

            # Сохранение заказа в сессии.
            request.session['order_id'] = order.id

            # Перенаправление на страницу оплаты
            return redirect(reverse('payment:process'))

            # context = {
            #     'order': order,
            # }
            # return render(request, 'orders/order/created.html', context)

    else:
        form = OrderCreateForm()

    context = {
        'cart': cart,
        'form': form,
    }

    return render(request, 'orders/order/create.html', context)
