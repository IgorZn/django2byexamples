from django.db import models
from django.conf import settings
from django.utils.text import slugify

from django.shortcuts import redirect
from django.urls import reverse

# Create your models here.

class Image(models.Model):
    """
    user - указывает пользователя, который добавляет изображение в закладки. Это поле является внешним ключом и
    использует связь «один ко многим». Пользователь может сохранять много изображений, но каждая картинка может быть
    сохранена только одним пользователем.

    created – дата и время создания объекта в базе данных. Так как мы указали auto_now_add, текущие время и дата будут
    подставлены автоматически. Аргумент db_index=True говорит Django о необходимости создать индекс по этому полю

    ---- Индексы баз данных улучшают производительность. Рассмотрите возможность добавления db_index=True для полей,
    которые часто используются в filter(), exclude(), order_by(). Для полей с unique=True и ForeignKey индексы создаются
    автоматически. Для определения составного индекса можно использовать Meta.index_together.

    """

    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='images_created', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    slug = models.SlugField(max_length=200, blank=True)
    url = models.URLField()
    images = models.ImageField(upload_to='images/%Y/%m/%d')
    description = models.TextField(blank=True)
    created = models.DateField(auto_now_add=True, db_index=True)
    user_like = models.ManyToManyField(settings.AUTH_USER_MODEL, related_name='images_liked', blank=True)

    # total_likes будет хранить количество лайков для картинки
    total_likes = models.PositiveIntegerField(db_index=True, default=0)

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('images:detail', args=[self.id, self.slug])

