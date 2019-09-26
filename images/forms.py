from django import forms
from .models import Image

from urllib import request
from django.core.files.base import ContentFile
from django.utils.text import slugify


class ImageCreateForm(forms.ModelForm):
    """
    Django дает возможность проверять каждое поле формы по отдельности с помощью методов вида clean_<fieldname>().
    Эти методы вызываются, когда мы обращаемся к методу is_valid() формы. Внутри функции валидации мы можем подменять
    значение или генерировать ошибки для конкретного поля.
    """

    class Meta:
        model = Image
        fields = ('title', 'url', 'description')
        widgets = {'url': forms.HiddenInput,}

    def clean_url(self):
        url = self.cleaned_data['url']
        valid_extension = ['jpg', 'jpeg']
        extension = url.rsplit('.', 1)[1].lower()

        if extension not in valid_extension:
            raise forms.ValidationError('The given URL doesnt match valid image extension')

        return url

    def save(self, force_insert=False, force_update=False, commit=True):
        image = super().save(commit=False)
        image_url = self.cleaned_data['url']
        image_name = f'{slugify(image.title)}.{image_url.rsplit(".", 1)[1].lower()}'

        # Скачиваем изображение
        response = request.urlopen(image_url)
        image.images.save(image_name, ContentFile(response.read()), save=False)

        if commit:
            image.save()
        return image

