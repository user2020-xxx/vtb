from django.db import models
from django.contrib.postgres.fields import ArrayField
import users.models
from django.urls import reverse


class ArrayLength(models.Func):
    function = 'CARDINALITY'

class Event(models.Model):
    id = models.AutoField(primary_key=True, unique=True)
    title = models.CharField(max_length=50, verbose_name="Название", blank=True, null=True)
    creator = models.CharField(max_length=1000, verbose_name="Создатель", null=True)
    slug = models.SlugField(max_length=100, unique=True, null=True)
    description = models.CharField(max_length=500, verbose_name="Описание", blank=True, null=True)
    datetime = models.DateTimeField(verbose_name="Дата и время", blank=True, null=True)
    prize = models.IntegerField(verbose_name="Награда", blank=True, null=True)
    likes = models.CharField(max_length=1000, verbose_name="Лайки", null=True)
    comment = models.CharField(max_length=1000, verbose_name="Комментарий", blank=True, null=True)
    image = models.TextField(max_length=1000, verbose_name="Изображение", blank=True, null=True)
    participants = ArrayField(models.IntegerField(blank=True), null=True, default=list)

    def __str__(self):
        return self.title
