# Generated by Django 4.2 on 2023-05-02 08:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0008_rename_submittimt_users_submittime'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='users',
            name='submitTime',
        ),
        migrations.AddField(
            model_name='memory',
            name='submitTime',
            field=models.DateField(null=True),
        ),
    ]