# Generated by Django 3.2.16 on 2022-10-08 16:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0008_auto_20221008_2108'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='image',
            field=models.TextField(blank=True, null=True, verbose_name='Изображение'),
        ),
    ]