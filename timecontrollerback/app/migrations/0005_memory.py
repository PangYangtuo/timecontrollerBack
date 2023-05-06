# Generated by Django 4.2 on 2023-04-30 08:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0004_project_usertoproject_users_type_alter_users_id'),
    ]

    operations = [
        migrations.CreateModel(
            name='Memory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('userAccount', models.IntegerField(null=True)),
                ('projectName', models.CharField(max_length=50, null=True)),
                ('timeLength', models.IntegerField(null=True)),
                ('type', models.CharField(max_length=50, null=True)),
                ('status', models.CharField(max_length=50, null=True)),
            ],
        ),
    ]