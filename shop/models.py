from django.db import models

# Create your models here.

class Category(models.Model):
    name = models.CharField(max_length=200, db_index=True)
    slug = models.SlugField(max_length=200, unique=True)

    class Meta:
        ordering = ('name',)
        verbose_name = 'category'
        verbose_name_plural = 'categories'

    def __str__(self):
        return self.name


class Product(models.Model):
    """
         category – ForeignKey на модель Category. Это отношение «многие к одному» – каждый товар принадлежит к
        одной категории, но каждая категория может включать множество товаров;
         name – наименование;
         slug – уникальное поле слага, которое будем использовать для построения человекопонятных URL’ов;
         image – не являющееся обязательным поле для фотографии товара;
         description – не являющееся обязательным описание товара;
         price – цена товара. Это поле определено как тип decimal.Decimal и будет
        хранить значения с фиксированной точностью. Максимальное количество цифр, включая десятичные,
        задается параметром max_digits, а количество цифр после запятой – decimal_places;
         available – булево значение, которое говорит о наличии товара. Мы будем использовать его для скрытия из
        каталога закончившихся товаров;
         created – дата и время создания товара;
         updated – дата и время последнего изменения
    """
    category = models.ForeignKey(Category, related_name='products', on_delete=models.CASCADE)
    name = models.CharField(max_length=200, db_index=True)
    slug = models.SlugField(max_length=200, db_index=True)
    image = models.ImageField(upload_to='product/%Y/%m/%d', blank=True)
    description = models.TextField(blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    available = models.BooleanField(default=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ('name',)
        index_together = (('id', 'slug'),)

    def __str__(self):
        return self.name
