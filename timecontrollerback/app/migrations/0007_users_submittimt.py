# Generated by Django 4.2 on 2023-05-02 07:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0006_memory_weeknumber'),
    ]

    operations = [
        migrations.AddField(
            model_name='users',
            name='submitTimt',
            field=models.DateField(null=True),
        ),
    ]