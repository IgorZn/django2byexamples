import os
from celery import Celery

# Задаем переменную окружения, содержащую название файла настроек нашего проекта
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'MyShop.settings')
# os.environ.setdefault('FORKED_BY_MULTIPROCESSING', '1')

app = Celery('MyShop')

app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()