from django import forms

class LoginForm(forms.Form):
    username = forms.CharField()

    # виджет PasswordInput, который будет
    # сформирован в HTML как элемент <input> с атрибутом type="password", поэтому
    # браузер будет работать с ним как с полем пароля
    password = forms.CharField(widget=forms.PasswordInput)
