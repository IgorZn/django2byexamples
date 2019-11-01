from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import ImageCreateForm

from django.shortcuts import get_object_or_404
from .models import Image

from django.http import JsonResponse
from django.views.decorators.http import require_POST
from actions.utils import create_action

from django.contrib import auth

import redis
from django.conf import settings

# Create your views here.

r = redis.StrictRedis(host=settings.REDIS_HOST,
                      port=settings.REDIS_PORT,
                      db=settings.REDIS_DB)


@login_required
def image_ranking(request):
    # Получаем набор рейтинга картинок.
    _image_ranking = r.zrange('image_ranking', 0, -1, desc=True)[:10]
    image_ranking_ids = [int(_id) for _id in _image_ranking]

    # Получаем отсортированный список самых популярных картинок.
    most_viewed = list(Image.objects.filter(id__in=image_ranking_ids))
    most_viewed.sort(key=lambda x: image_ranking_ids.index(x.id))

    print(_image_ranking, most_viewed)

    context = {
        'section': 'images',
        'most_viewed': most_viewed,
    }

    return render(request, 'images/image/ranking.html', context)


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
                create_action(request.user, 'likes', image)
            else:
                image.user_like.remove(request.user)
            return JsonResponse({'status': 'ok'})
        except:
            pass
    return JsonResponse({'status': 'ok'})


def image_detail(request, id, slug):
    image = get_object_or_404(Image, id=id, slug=slug)
    print(image)

    # Увеличиваем количество просмотров картинки на 1
    total_views = r.incr(f'image:{image.id}:views')

    # Увеличиваем рейтинг картинки на 1
    r.zincrby('image_ranking', image.id, 1)

    context = {
        'section': 'images',
        'image': image,
        'total_views': total_views,
    }
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
            create_action(request.user, 'bookmarked image', new_item)
            messages.success(request, 'Image added successfully')
            return redirect(new_item.get_absolute_url())

    form = ImageCreateForm(data=request.GET)

    context = {
        'section': 'images',
        'form': form
    }
    return render(request, 'images/image/create.html', context)


def image_list(request):
    object_list = Image.objects.all()
    context = {'urls': object_list}
    return render(request, 'images/image/image_list.html', context)
