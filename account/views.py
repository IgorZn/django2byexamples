from django.shortcuts import render

from django.http import HttpResponse
from django.contrib.auth import authenticate, login

from .forms import LoginForm

# Create your views here.


def user_login(request):
    # Когда пользователь отправляет
    # форму POST-запросом, мы обрабатываем ее
    if request.method == 'POST':
        # создаем объект формы с данными
        form = LoginForm(request.POST)
        # проверяем, правильно ли заполнена форма
        if form.is_valid():
            cd = form.cleaned_data
            # если данные введены верно, сверяем их с данными в базе с помощью
            # функции authenticate
            user = authenticate(request,
                                username=cd['username'],
                                password=cd['password'])
        if user is not None:
            # если пользователь был аутентифицирован, проверяем, активен ли он
            if user.is_active:
                # если пользователь активный, авторизуем его на сайте
                # посредством вызова функции login()
                login(request, user)
                return HttpResponse('Authenticated successfully')
            else:
                return HttpResponse('Disabled account')
        else:
            return HttpResponse('Invalid login')
    else:
        form = LoginForm()

    return render(request, 'blog/account/login.html', {'form': form})
