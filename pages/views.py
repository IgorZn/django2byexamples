from django.shortcuts import render

# Create your views here.


def index(request):
    context = {}
    return render(request, 'pages/index.html', context)

def bootstrap(request):
    context = {}
    return render(request, 'pages/bootstrap.html', context)
