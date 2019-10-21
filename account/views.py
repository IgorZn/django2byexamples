from django.shortcuts import render

from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib import messages, auth
from django.contrib.auth import views as auth_view

from .forms import LoginForm, UserRegistrationForm, UserEditForm, ProfileEditForm
from .models import Profile

from django.shortcuts import get_object_or_404
from django.contrib.auth.models import User

from django.http import JsonResponse
from django.views.decorators.http import require_POST
from common.decorators import ajax_required
from .models import Contact

from actions.utils import create_action
from actions.models import Action

# Create your views here.


@ajax_required
@require_POST
@login_required
def user_follow(request):
    user_id = request.POST.get('id')
    action = request.POST.get('action')
    if user_id in action:
        try:
            user = User.objects.get(id=user_id)
            if action == 'follow':
                Contact.objects.get_or_create(user_form=request.user, user_to=user)
                create_action(request.user, 'is following', user)
            else:
                Contact.objects.filter(user_form=request.user, user_to=user).delete()
            return JsonResponse({'status': 'ok'})
        except User.DoesNotExist:
            return JsonResponse({'status': 'ok'})
    return JsonResponse({'status': 'ok'})


@login_required
def user_list(request):
    users = User.objects.filter(is_active=True)
    context = {
        'section': 'people',
        'users': users
    }

    return render(request, 'account/user/list.html', context)


@login_required
def user_detail(request, username):
    user = get_object_or_404(User, username=username, is_active=True)
    context = {
        'section': 'people',
        'user': user
    }

    return render(request, 'account/user/detail.html', context)


def register(request):
    if request.method == 'POST':
        user_form = UserRegistrationForm(request.POST)
        if user_form.is_valid():
            # Создаем нового пользователя, но пока не сохраняем в базу данных.
            new_user = user_form.save(commit=False)

            # Задаем пользователю зашифрованный пароль.
            new_user.set_password(user_form.cleaned_data['password'])

            # Создать Profile новому пользователю
            Profile.objects.create(user=new_user)
            create_action(new_user, 'has created an account')

            # Задаем пользователю зашифрованный пароль.
            new_user.save()

            return render(request, 'account/register_done.html', {'new_user': new_user})
    else:
        user_form = UserRegistrationForm()

    return render(request, 'account/register.html', {'user_form': user_form})


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
                auth.login(request, user)
                messages.success(request, 'You are now logged in')
                return HttpResponse('Authenticated successfully')
            else:
                return HttpResponse('Disabled account')
        else:
            return HttpResponse('Invalid login')
    else:
        form = LoginForm()

    return render(request, 'account/login.html', {'form': form})


class MyLogin(auth_view.LoginView):
    # template_name = 'account/login.html'

    def form_valid(self, form):
        """Security check complete. Log the user in."""
        login(self.request, form.get_user())
        messages.success(self.request, 'You are now logged in')
        return HttpResponseRedirect(self.get_success_url())


@login_required
def dashboard(request):
    # По умолчанию отображаем все действия.
    actions = Action.objects.exclude(user=request.user)
    following_ids = request.user.following.values_list('id', flat=True)
    if following_ids:
        # Если текущий пользователь подписался на кого-то,
        # отображаем только действия этих пользователей.
        actions = actions.filter(user_id__in=following_ids)
    actions = actions.select_related('user', 'user__profile').prefetch_related('target')[:10]

    context = {
        'session': dashboard,
        'actions': actions
    }

    return render(request, 'account/dashboard.html', context)


@login_required
def edit(request):
    if request.method == 'POST':
        user_form = UserEditForm(instance=request.user, data=request.POST)
        profile_form = ProfileEditForm(instance=request.user.profile,
                                       data=request.POST,
                                       files=request.FILES)

        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
    else:
        user_form = UserEditForm(instance=request.user)
        profile_form = ProfileEditForm(instance=request.user.profile)

    context = {'user_form': user_form, 'profile_form': profile_form}

    return render(request, 'account/edit.html', context)


@login_required
def profile(request):
    return render(request, 'account/profile.html')