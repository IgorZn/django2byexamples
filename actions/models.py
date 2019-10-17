from django.db import models
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey

# Create your models here.


class Action(models.Model):

    # пользователь, который выполнил действие. Внешний ключ ForeignKey на стандартную модель Django – User;
    user = models.ForeignKey('auth.User', related_name='actions', db_index=True, on_delete=models.CASCADE)

    # информация о том, какое действие было выполнено;
    verb = models.CharField(max_length=255)

    # дата и время, показывающие, когда был создан объект.
    # Мы используем auto_now_add=True, чтобы автоматически выставлять текущее
    # время, когда объект сохраняется в базу данных
    created = models.DateTimeField(auto_now_add=True, db_index=True)

    # внешний ключ на модель ContentType
    target_ct = models.ForeignKey(
        ContentType, blank=True, null=True, related_name='target_obj', on_delete=models.CASCADE)

    # PositiveIntegerField для хранения идентификатора на связанный объект
    target_id = models.PositiveIntegerField(null=True, blank=True, db_index=True)

    # GenericForeignKey – поле для обращения к связанному объекту на
    # основании его типа и ID
    target = GenericForeignKey('target_ct', 'target_id')

    class Meta:
        ordering = ('-created',)


