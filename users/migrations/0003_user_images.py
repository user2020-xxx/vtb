# Generated by Django 3.2.16 on 2022-10-08 16:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20221008_0113'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='images',
            field=models.ImageField(null=True, upload_to='uploads'),
        ),
    ]
