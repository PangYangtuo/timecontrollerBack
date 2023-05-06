# Generated by Django 4.2 on 2023-04-30 08:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0003_users_workaccount'),
    ]

    operations = [
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50, null=True)),
                ('type', models.CharField(max_length=50, null=True)),
                ('leaderId', models.IntegerField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='UserToProject',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('userId', models.IntegerField(null=True)),
                ('projectId', models.IntegerField(null=True)),
            ],
        ),
        migrations.AddField(
            model_name='users',
            name='type',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='users',
            name='id',
            field=models.AutoField(auto_created=True, primary_key=True, serialize=False),
        ),
    ]
