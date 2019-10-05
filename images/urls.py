from django.urls import path
from . import views

app_name = 'images'

urlpatterns = [
    path('create/', views.image_create, name='create'),
    path('like/', views.image_like, name='like'),
    path('images-list/', views.image_list, name='images-list'),
    path('detail/<int:id>/<slug:slug>', views.image_details, name='detail'),
]