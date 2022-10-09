from django.db import models  # Подключаем работу с моделями
# Подключаем классы для создания пользователей
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from .managers import MyUserManager


class User(AbstractBaseUser, PermissionsMixin):
    id = models.AutoField(primary_key=True, unique=True)
    username = models.CharField(max_length=50, verbose_name="Имя пользователя", unique=True)
    first_name = models.CharField(max_length=50, verbose_name="Имя", blank=True, null=True)
    last_name = models.CharField(max_length=50, verbose_name="Фамилия", blank=True, null=True)
    patronymic = models.CharField(max_length=50, verbose_name="Отчество", blank=True, null=True)
    role = models.CharField(max_length=50, verbose_name="Роль", blank=True, null=True)
    coins = models.IntegerField(blank=True, verbose_name="Кошелек", null=True)
    email = models.EmailField(max_length=100, verbose_name="Почтовый адрес", unique=True)
    images = models.ImageField(upload_to='uploads', null=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = []

    objects = MyUserManager()

    def __str__(self):
        return self.email
