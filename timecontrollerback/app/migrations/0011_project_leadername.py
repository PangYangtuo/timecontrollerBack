# Generated by Django 4.2 on 2023-05-03 02:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0010_project_numbering'),
    ]

    operations = [
        migrations.AddField(
            model_name='project',
            name='leaderName',
            field=models.CharField(max_length=50, null=True),
        ),
    ]