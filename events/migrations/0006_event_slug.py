# Generated by Django 3.2.16 on 2022-10-08 11:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0005_auto_20221008_1519'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='slug',
            field=models.SlugField(max_length=100, null=True, unique=True),
        ),
    ]
