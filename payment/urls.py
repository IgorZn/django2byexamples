from django.urls import path
from .views import *

app_name = 'payment'

urlpatterns = [
	path('process/', PaymentProcess.as_view(), name='process'),
	path('done/', PaymentDone.as_view(), name='done'),
	path('canceled/', PaymentCanceled.as_view(), name='canceled'),
]