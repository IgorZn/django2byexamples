from django.urls import path, reverse_lazy
from django.contrib.auth import views as auth_view
from . import views

app_name = 'account'

urlpatterns = [
    # path('login/', views.user_login, name='login'),
    path('login/', auth_view.LoginView.as_view(), name='login'),
    path('logout/', auth_view.LogoutView.as_view(), name='logout'),

    path('password_change/',
         auth_view.PasswordChangeView.as_view(
             template_name='registration/password_change_form.html',
             success_url=reverse_lazy('account:password_change_done')), name='password_change'),

    path('password_change/done/',
         auth_view.PasswordChangeDoneView.as_view(
             template_name='registration/password_change_done.html'), name='password_change_done'),

    path('', views.dashboard, name='dashboard'),
]
