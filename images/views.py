from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import ImageCreateForm

from django.shortcuts import get_object_or_404
from .models import Image

from django.http import JsonResponse
from django.views.decorators.http import require_POST

# Create your views here.

@login_required
@require_POST
def image_like(request):
    image_id = request.POST.get('id')
    action = request.POST.get('action')

    if image_id and action:
        try:
            image = Image.objects.get(id=image_id)
            if action == 'like':
                image.user_like.add(request.user)
            else:
                image.user_like.remove(request.user)
            return JsonResponse({'status': 'ok'})
        except:
            pass
    return JsonResponse({'status': 'ok'})


def image_details(request, id, slug):
    image = get_object_or_404(Image, id=id, slug=slug)
    context = {'section': 'images', 'image': image}
    return render(request, 'images/image/detail.html', context)


@login_required
def image_create(request):
    if request.method == 'POST':
        # Форма отправлена
        form = ImageCreateForm(data=request.POST)
        if form.is_valid():
            cd = form.cleaned_data

            new_item = form.save(commit=False)
            # добавляем пользователя к созданному объекту
            new_item.user = request.user
            new_item.save()
            messages.success(request, 'Image added successfully')
            return redirect(new_item.get_absolute_url())

    form = ImageCreateForm(data=request.GET)
    context = {'section': 'images', 'form': form}
    return render(request, 'images/image/create.html', context)


def image_list(request):
    object_list = Image.objects.all()
    context = {'urls': object_list}
    return render(request, 'images/image/image_list.html', context)
