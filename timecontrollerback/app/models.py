from django.db import models

# Create your models here.
from django.db import models


# Create your models here.
# 领导type为1，员工type为0，超级管理员type为-1
class Users(models.Model):
    id = models.AutoField(primary_key=True, auto_created=True)
    workAccount = models.IntegerField(null=True)
    name = models.CharField(max_length=50, null=True)
    apartment = models.CharField(max_length=50, null=True)
    account = models.IntegerField(null=True)
    password = models.IntegerField(null=True)
    leader = models.CharField(max_length=50, null=True)
    type = models.CharField(null=True, max_length=50)


# 项目库
class Project(models.Model):
    id = models.AutoField(primary_key=True, auto_created=True)
    numbering = models.CharField(null=True, max_length=50)
    name = models.CharField(null=True, max_length=50)
    type = models.CharField(null=True, max_length=50)
    leaderId = models.IntegerField(null=True)
    leaderName = models.CharField(null=True, max_length=50)


# 项目和人员对应关系表
class UserToProject(models.Model):
    userId = models.IntegerField(null=True)
    projectId = models.IntegerField(null=True)


# 打卡记录表
class Memory(models.Model):
    userAccount = models.IntegerField(null=True)
    projectName = models.CharField(null=True, max_length=50)
    timeLength = models.IntegerField(null=True)
    type = models.CharField(null=True, max_length=50)
    status = models.CharField(null=True, max_length=50)
    weekNumber = models.IntegerField(null=True)
    submitTime = models.DateField(null=True)
    leaderId = models.IntegerField(null=True)
    saveTime = models.DateField(null=True)
