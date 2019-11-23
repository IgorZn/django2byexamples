from django.shortcuts import render
from MyShop import braintree_keys
from braintree import Configuration, Environment

Configuration.configure(
    Environment.Sandbox,
    braintree_keys.BRAINTREE_MERCHANT_ID,
    braintree_keys.BRAINTREE_PUBLIC_KEY,
    braintree_keys.BRAINTREE_PRIVATE_KEY
)

# Create your views here.
