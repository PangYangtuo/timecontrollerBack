import json

from django.core import serializers
from django.forms import model_to_dict
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view, parser_classes
from rest_framework.parsers import FormParser

from app import models
import datetime
from datetime import date


# Create your views here.
def get(response):
    return JsonResponse({'name': 'pyt'})


def test(request):
    hello = ('test', 'nice to meet you')
    # print(request)
    return JsonResponse({'header': hello})


@csrf_exempt
def searchUser(request):
    global password
    # print("=======================")
    # print(request.POST)
    # print("=======================")
    print(str(request.POST.get('account')) + " 正在登录......")
    user = models.Users.objects.filter(account=request.POST.get('account'))
    # print(user)
    if user.exists():
        for item in user:
            password = model_to_dict(item).get('password')
        getToday()
        if int(request.POST.get('password')) == password:
            print("登录成功")
            for i in models.Users.objects.filter(account=request.POST.get('account')):
                if i.__getattribute__('type') == '0':
                    return HttpResponse(0)
                elif i.__getattribute__('type') == '2':
                    return HttpResponse(3)
                else:
                    return HttpResponse(2)
        else:
            return HttpResponse(1)
    else:
        return HttpResponse(-1)


def getToday():
    # 获取当前日期
    current_date = datetime.date.today()
    # 输出当前日期
    # print("当前日期为：", current_date)
    # print("第" + str(get_week_num(str(current_date))) + "周")
    return str(get_week_num(str(current_date)))


def get_week_num(date):
    date = datetime.datetime.strptime(date, '%Y-%m-%d')
    first_day_of_week = datetime.datetime(2023, 4, 24)
    week_number = ((date - first_day_of_week).days // 7) + 1
    return week_number


# 获取今天是第几周
@csrf_exempt
def getWeekToday(request):
    date = ''
    # print(request.POST)
    for item in request.POST:
        date = item
    # print(getWhatWeek(date))
    result = get_week_num(date)
    # print(result)
    return HttpResponse(result)


@csrf_exempt
def userSearchByApartment(request):
    all = []
    # print(request.POST)
    result = []
    for item in request.POST.values():
        # print(item)
        result.append(models.Users.objects.filter(apartment=item))
    # print(result)
    if not request.POST:
        result.append(models.Users.objects.all())
    # print('this is the result:'+str(result))
    peoples = []
    j = 0
    for i in result:
        # print(i.count())
        for j in range(0, i.count()):
            leader = ''
            if i.values_list()[j][6] != '':
                for item in models.Users.objects.filter(id=i.values_list()[j][6]):
                    leader = item.__getattribute__('name')
            people = {'id': i.values_list()[j][0],
                      'name': i.values_list()[j][2],
                      'department': i.values_list()[j][3],
                      'account': i.values_list()[j][4],
                      'password': i.values_list()[j][5],
                      'leader': leader}
            # print(people)
            peoples.append(people)
    leaders = []
    for item in models.Users.objects.filter(type=1):
        leader = {
            'label': item.__getattribute__('name'),
            'value': item.__getattribute__('name')
        }
        leaders.append(leader)
    all.append(peoples)
    all.append(leaders)
    json_data = json.dumps(all)
    return JsonResponse(json_data, safe=False)


@csrf_exempt
def getMemoryByAccount(request):
    all = []
    duration = ''
    status = ''
    data = json.loads(request.body)
    # print(data)
    # print(data.get('account'))
    weekToday = getToday()
    # print("weekToday is " + weekToday)
    account = data.get('account')
    projectId = []
    userId = ''
    for item in models.Users.objects.filter(account=account):
        userId = item.__getattribute__('id')
    for item in models.UserToProject.objects.filter(userId=userId):
        projectId.append(item.__getattribute__('projectId'))
    for perProjectId in projectId:
        for i in models.Project.objects.filter(id=perProjectId):
            if models.Memory.objects.filter(userAccount=account, projectName=i.__getattribute__('name'),
                                            weekNumber=getToday()).exists():
                for j in models.Memory.objects.filter(userAccount=account, projectName=i.__getattribute__('name'),
                                                      weekNumber=getToday()):
                    duration = j.__getattribute__('timeLength')
                    status = j.__getattribute__('status')
            else:
                duration = 0
                status = '未审核'
            message = {
                'name': i.__getattribute__('name'),
                'duration': duration,
                'type': i.__getattribute__('type'),
                'status': status
            }
            all.append(message)
    for i in models.Memory.objects.filter(userAccount=account, type='其他项目'):
        message = {
            'name': i.__getattribute__('projectName'),
            'duration': i.__getattribute__('timeLength'),
            'type': i.__getattribute__('type'),
            'status': i.__getattribute__('status')
        }
        all.append(message)
    json_data = json.dumps(all)
    return JsonResponse(json_data, safe=False)


@csrf_exempt
def newMemory(request):
    # print('hello')
    memory = json.loads(request.body)
    week = getToday()
    # print(memory)
    leaderId = ''
    for i in models.Users.objects.filter(account=memory.get('account')):
        leaderId = i.__getattribute__('leader')
    memoryNew = models.Memory(userAccount=memory.get('account'), type=memory.get('type'),
                              timeLength=memory.get('duration'),
                              projectName=memory.get('name'),
                              status=memory.get('status'), weekNumber=week,
                              submitTime=date.today(), leaderId=leaderId)
    print(memoryNew.save())
    return HttpResponse(1)


@csrf_exempt
def changeMemory(request):
    change = json.loads(request.body)
    week = getToday()
    # print("====================================================================", change)
    # print(week)
    if models.Memory.objects.filter(userAccount=change.get('account'), projectName=change.get('name'),
                                    weekNumber=week).exists():
        models.Memory.objects.filter(userAccount=change.get('account'), projectName=change.get('name'),
                                     weekNumber=week).update(timeLength=change.get('duration'), submitTime=date.today(),
                                                             status='未审核')
    else:
        if change.get('type') == '其他项目':
            leaderId = ''
            for i in models.Users.objects.filter(account=change.get('account')):
                leaderId = i.__getattribute__('leader')
            models.Memory(userAccount=change.get('account'), projectName=change.get('name'), weekNumber=week,
                          submitTime=date.today(),
                          timeLength=change.get('duration'), type=change.get('type'), status=change.get('status'),
                          leaderId=leaderId).save()
        else:
            leaderId = ''
            for i in models.Project.objects.filter(name=change.get('name')):
                leaderId = i.__getattribute__('leaderId')
            models.Memory(userAccount=change.get('account'), projectName=change.get('name'), weekNumber=week,
                          submitTime=date.today(),
                          timeLength=change.get('duration'), type=change.get('type'), status=change.get('status'),
                          leaderId=leaderId).save()
    return HttpResponse(1)


@csrf_exempt
def deleteMemory(request):
    delete = json.loads(request.body)
    # print(delete)
    week = getToday()
    # print(delete)
    models.Memory.objects.filter(userAccount=delete.get('account'), projectName=delete.get('name'),
                                 weekNumber=week).delete()
    return HttpResponse(1)


@csrf_exempt
def getMemeoryTableByClickCandler(request):
    account = request.POST.get('account')
    data = request.POST.get('data')
    all = []
    for item in models.Memory.objects.filter(userAccount=account, weekNumber=data):
        memory = {
            'name': item.__getattribute__('projectName'),
            'duration': item.__getattribute__('timeLength'),
            'status': item.__getattribute__('status'),
            'type': item.__getattribute__('type')
        }
        all.append(memory)
    # print(all)
    # print(account)
    # print(data)
    json_data = json.dumps(all)
    return JsonResponse(json_data, safe=False)


@csrf_exempt
def createNewUser(request):
    # print(request.POST)
    userType = 0
    if request.POST.get('leader') == '':
        userType = 1
        account = ''

    else:
        account = ''
        for item in models.Users.objects.filter(name=request.POST.get('leader')):
            account = item.__getattribute__('account')
    newUser = models.Users(name=request.POST.get('name'), apartment=request.POST.get('apartment'),
                           account=request.POST.get('account'),
                           password=request.POST.get('password'), leader=account,
                           workAccount=request.POST.get('number'), type=userType, )
    newUser.save()
    alls = []
    for item in models.Users.objects.filter(account=request.POST.get('account')):
        user = {'id': item.__getattribute__('id'),
                'name': item.__getattribute__('name'),
                'department': item.__getattribute__('apartment'),
                'account': item.__getattribute__('account'),
                'password': item.__getattribute__('password'),
                'leader': request.POST.get('leader')}
        alls = [user]
    result = json.dumps(alls)
    return JsonResponse(result, safe=False)


@csrf_exempt
def changeUser(request):
    # print('==========================================', request.POST)
    account = ''
    for i in models.Users.objects.filter(name=request.POST.get('leader')):
        account = i.__getattribute__('id')
    models.Users.objects.filter(id=request.POST.get('id')).update(apartment=request.POST.get('apartment'),
                                                                  password=request.POST.get('password'),
                                                                  leader=account)
    return HttpResponse(0)


@csrf_exempt
def deleteUser(request):
    # print(request.POST)
    models.Users.objects.filter(id=request.POST.get('id')).delete()
    return HttpResponse(0)


#
# memory = {
#     'submitter': name,
#     'submitTime': str(item.__getattribute__('submitTime')),
#     'projectName': item.__getattribute__('projectName'),
#     'projectType': item.__getattribute__('type'),
#     'applyDuration': item.__getattribute__('timeLength'),
#     'apartment': apartment,
#     'id': item.__getattribute__('id')
# }
@csrf_exempt
def reviewCreated(request):
    account = request.POST.get('account')
    userId = ''
    projectIds = []
    projectNames = []
    week = getToday()
    print(account, '用户尝试获取审批记录')
    for item in models.Users.objects.filter(account=account):
        userId = item.__getattribute__('id')
    for item in models.Project.objects.filter(leaderId=userId):
        projectIds.append(item.__getattribute__('id'))
        projectNames.append(item.__getattribute__('name'))
    userIds = []
    # print('projectIds:', projectIds)
    memorys = []
    for item in projectIds:
        for i in models.UserToProject.objects.filter(projectId=item):
            userIds.append(i.__getattribute__('userId'))
    userIds = list(set(userIds))
    for item in projectNames:
        projectType = ''
        projectId = ''
        for item1 in models.Project.objects.filter(name=item):
            projectId = item1.__getattribute__('id')
            projectType = item1.__getattribute__('type')
        for user in userIds:
            newAccount = ''
            name = ''
            apartment = ''
            for i in models.Users.objects.filter(id=user):
                newAccount = i.__getattribute__('account')
                name = i.__getattribute__('name')
                apartment = i.__getattribute__('apartment')
            add = 0
            submitTime = ''
            for item1 in models.Memory.objects.filter(projectName=item, userAccount=newAccount, weekNumber=week,
                                                      status='未审核'):
                add += item1.__getattribute__('timeLength')
                submitTime = item1.__getattribute__('submitTime')
            if add > 0:
                # print(projectType, item, projectId, name, apartment, add, submitTime)
                memory = {
                    'submitter': name,
                    'submitTime': str(submitTime),
                    'projectName': item,
                    'projectType': projectType,
                    'applyDuration': add,
                    'apartment': apartment,
                    'id': projectId,
                    'userId': newAccount
                }
                memorys.append(memory)
    json_data = json.dumps(memorys)
    return JsonResponse(json_data, safe=False)


@csrf_exempt
def passReview(request):
    account = request.POST.get('id')
    week = getToday()
    projectName = request.POST.get('projectName')
    print(projectName)
    print(account)
    models.Memory.objects.filter(userAccount=account, projectName=projectName, weekNumber=week).update(status='已审核')
    return HttpResponse(0)


@csrf_exempt
def backReview(request):
    account = request.POST.get('id')
    week = getToday()
    projectName = request.POST.get('projectName')
    print(projectName)
    print(account)
    models.Memory.objects.filter(userAccount=account, projectName=projectName, weekNumber=week).update(status='已驳回')
    return HttpResponse(0)


@csrf_exempt
def getUsersSelections(request):
    all = []
    leaderApartments = []
    usersApartments = []
    leaders = {}
    users = {}
    for item in models.Users.objects.filter(type=1):
        leaderApartments.append(item.__getattribute__('apartment'))
    leaderApartments = list(set(leaderApartments))
    for i in leaderApartments:
        leader = []
        for item in models.Users.objects.filter(type=1, apartment=i):
            leader.append(item.__getattribute__('name'))
        leaders.update({i: leader})

    #     寻找用户
    for item in models.Users.objects.all():
        usersApartments.append(item.__getattribute__('apartment'))
    usersApartments = list(set(usersApartments))
    for i in usersApartments:
        user = []
        for item in models.Users.objects.filter(apartment=i):
            user.append(item.__getattribute__('name'))
        users.update({i: user})
    # print(leaderApartments)
    # print(leaders)
    all.append(leaders)
    all.append(leaderApartments)
    all.append(users)
    all.append(usersApartments)
    projects = []
    for item in models.Project.objects.all():
        id = item.__getattribute__('id')
        name = item.__getattribute__('name')
        numbering = item.__getattribute__('numbering')
        leadername = item.__getattribute__('leaderName')
        type = item.__getattribute__('type')
        userid = []
        users = []
        for i in models.UserToProject.objects.filter(projectId=id):
            userid.append(i.__getattribute__('userId'))
        for i in userid:
            for j in models.Users.objects.filter(id=i):
                user = {
                    'department': j.__getattribute__('apartment'),
                    'member': j.__getattribute__('name')
                }
                users.append(user)
        projectMessage = {
            'id': numbering,
            'name': name,
            'leader': leadername,
            'type': type,
            'members': users
        }
        projects.append(projectMessage)
    # print(projects)
    all.append(projects)

    json_data = json.dumps(all)
    return JsonResponse(json_data, safe=False)


@parser_classes([FormParser])
@api_view(['POST'])
def createProject(request):
    data = request.POST
    # print(data)
    id = data.get('id')
    managers = json.loads(data.get('managers'))
    type = data.get('type')
    name = data.get('name')
    members = json.loads(data.get('members'))
    # print(members)
    # print(managers.get('name'))
    leaderId = ''
    for item in models.Users.objects.filter(name=managers.get('name')):
        leaderId = item.__getattribute__('id')
    project = models.Project(numbering=id, name=name, type=type, leaderName=managers.get('name'), leaderId=leaderId)
    project.save()
    projectId = ''
    for i in models.Project.objects.filter(numbering=id, name=name, type=type, leaderName=managers.get('name'),
                                           leaderId=leaderId):
        projectId = i.__getattribute__('id')
    member = []
    for item in members:
        for i in models.Users.objects.filter(name=item.get('name'), apartment=item.get('department')):
            # print(i.__getattribute__('id'))
            member.append(i.__getattribute__('id'))
    member = list(set(member))
    # print(member)
    # print(projectId)
    for id in member:
        new = models.UserToProject(userId=id, projectId=projectId)
        new.save()
    return HttpResponse(0)


@csrf_exempt
def changeProject(request):
    # print('this is ', request.POST)
    managerID = ''
    memberIds = []
    for i in models.Users.objects.filter(name=request.POST.get('managers')):
        managerID = i.__getattribute__('id')
    # print(request.POST.get('members'))
    for i in json.loads(request.POST.get('members')):
        apartment = i.get('department')
        name = i.get('member')
        for j in models.Users.objects.filter(apartment=apartment, name=name):
            memberId = j.__getattribute__('id')
            memberIds.append(memberId)
    memberIds = list(set(memberIds))
    # print(memberIds)
    recentProjectName = ''
    for item in models.Project.objects.filter(numbering=request.POST.get('id')):
        recentProjectName = item.__getattribute__('name')
    models.Project.objects.filter(numbering=request.POST.get('id')).update(leaderId=managerID,
                                                                           leaderName=request.POST.get('managers'),
                                                                           type=request.POST.get('type'),
                                                                           name=request.POST.get('name'))
    models.Memory.objects.filter(projectName=recentProjectName).update(projectName=request.POST.get('name'),
                                                                       type=request.POST.get('type'))
    projectId = ''
    for i in models.Project.objects.filter(numbering=request.POST.get('id')):
        projectId = i.__getattribute__('id')
    for i in models.UserToProject.objects.filter(projectId=projectId):
        i.delete()
    for i in memberIds:
        models.UserToProject(userId=i, projectId=projectId).save()
    return HttpResponse(0)


@csrf_exempt
def allMemory(request):
    memorys = []
    for item in models.Memory.objects.filter(status='未审核'):
        submitName = ''
        department = ''
        for i in models.Users.objects.filter(account=item.__getattribute__('userAccount')):
            submitName = i.__getattribute__('name')
            department = i.__getattribute__('apartment')
        projectName = item.__getattribute__('projectName')
        projectType = item.__getattribute__('type')
        submitHours = item.__getattribute__('timeLength')
        auditor = ''
        for i in models.Users.objects.filter(id=item.__getattribute__('leaderId')):
            auditor = i.__getattribute__('name')
        submitDate = item.__getattribute__('submitTime')
        overTime = ''
        isOverdue = 'false'
        memory = {
            'submitter': submitName,
            'department': department,
            'projectName': projectName,
            'projectType': projectType,
            'submitHours': submitHours,
            'auditor': auditor,
            'submitTime': str(submitDate),
            'overdueTime': '',
            'isOverdue': isOverdue
        }
        memorys.append(memory)
    json_data = json.dumps(memorys)
    return JsonResponse(json_data, safe=False)


@csrf_exempt
def newIndex(request):
    account = request.POST.get('account')
    week = getToday()
    # 获取当前日期
    today = datetime.date.today()

    # 计算本周周一的日期
    monday = today - datetime.timedelta(days=today.weekday())

    # 计算本周周二至周日的日期，并添加到列表中
    dates = []
    for i in range(7):
        date = monday + datetime.timedelta(days=i)
        dates.append(date.strftime('%Y-%m-%d'))
    # 输出结果
    print(dates)
    userId = ''
    for item in models.Users.objects.filter(account=account):
        userId = item.__getattribute__('id')
    print(userId)
    projectId = []
    for item in models.UserToProject.objects.filter(userId=userId):
        projectId.append(item.__getattribute__('projectId'))
    print(projectId)
    projectName = []
    for id in projectId:
        for item in models.Project.objects.filter(id=id):
            projectName.append(item.__getattribute__('name'))
    print(projectName)
    messages = []
    for name in projectName:
        arr = [0] * 7
        status = ''
        this = models.Memory.objects.filter(userAccount=account, projectName=name, weekNumber=week)
        if this.exists():
            for i in this:
                for j in dates:
                    if str(i.__getattribute__('saveTime')) == j:
                        index = dates.index(j)
                        arr[index] = i.__getattribute__('timeLength')
                        status = i.__getattribute__('status')
            print(arr)
            message = {
                'name': name,
                'workingHours': arr,
                'total': 0,
                'status': status
            }
            messages.append(message)
        else:
            message = {
                'name': name,
                'workingHours': [0] * 7,
                'total': 0,
                'status': '未保存'
            }
            messages.append(message)
    print(messages)
    json_data = json.dumps(messages)
    return JsonResponse(json_data, safe=False)


@csrf_exempt
def newIndexSubmit(request):
    account = request.POST.get('account')
    print(account)
    week = getToday()
    print(week)
    # print(request.POST.get('test'))
    arr = [int(x) for x in request.POST.get('test2').split(',')]
    arrName = request.POST.get('test').split(",")

    # print(arr)
    # print(arrName)
    total = []
    # 每七个一组
    for i in range(0, len(arr), 7):
        total.append(arr[i:i + 7])
        # 获取当前日期
    today = datetime.date.today()

    # 计算本周周一的日期
    monday = today - datetime.timedelta(days=today.weekday())

    # 计算本周周二至周日的日期，并添加到列表中
    dates = []
    for i in range(7):
        date = monday + datetime.timedelta(days=i)
        dates.append(date.strftime('%Y-%m-%d'))
    # 输出结果
    # print(dates)
    # 放在一个大数组中
    # print(total)
    models.Memory.objects.filter(userAccount=account, weekNumber=week).exclude(status="已审核").update(submitTime=today)
    for i in range(0, len(total)):
        for j in range(0, len(total[i])):
            if total[i][j] >= 0:
                # print('===================================')
                # print('j is ', j)
                # print(dates[j])
                # print(arrName[i])

                if models.Memory.objects.filter(userAccount=account, projectName=arrName[i], weekNumber=week,
                                                saveTime=dates[j]).exists():
                    # print('存在')
                    models.Memory.objects.filter(userAccount=account, projectName=arrName[i], weekNumber=week,
                                                 saveTime=dates[j]).update(
                        timeLength=total[i][j], status='未审核')
                    # print('刷新项目')
                    # print()

                else:
                    # print('不存在')
                    # print()
                    leaderId = ''
                    type = ''
                    for id in models.Project.objects.filter(name=arrName[i]):
                        leaderId = id.__getattribute__('leaderId')
                        type = id.__getattribute__('type')
                    # print(leaderId,type)
                    models.Memory(userAccount=account, projectName=arrName[i], weekNumber=week, timeLength=total[i][j],
                                  saveTime=dates[j], submitTime=dates[j], status='未审核', leaderId=leaderId,
                                  type=type).save()
    return HttpResponse(0)


@csrf_exempt
def newIndexSave(request):
    account = request.POST.get('account')
    print(account)
    week = getToday()
    print(week)
    # print(request.POST.get('test'))
    arr = [int(x) for x in request.POST.get('test2').split(',')]
    arrName = request.POST.get('test').split(",")

    # print(arr)
    # print(arrName)
    total = []
    # 每七个一组
    for i in range(0, len(arr), 7):
        total.append(arr[i:i + 7])
        # 获取当前日期
    today = datetime.date.today()

    # 计算本周周一的日期
    monday = today - datetime.timedelta(days=today.weekday())

    # 计算本周周二至周日的日期，并添加到列表中
    dates = []
    for i in range(7):
        date = monday + datetime.timedelta(days=i)
        dates.append(date.strftime('%Y-%m-%d'))
    # 输出结果
    # print(dates)
    # 放在一个大数组中
    # print(total)
    for i in range(0, len(total)):
        for j in range(0, len(total[i])):
            if total[i][j] >= 0:
                # print('===================================')
                # print('j is ', j)
                # print(dates[j])
                # print(arrName[i])

                if models.Memory.objects.filter(userAccount=account, projectName=arrName[i], weekNumber=week,
                                                saveTime=dates[j]).exists():
                    # print('存在')
                    for q in models.Memory.objects.filter(userAccount=account, projectName=arrName[i], weekNumber=week,
                                                          saveTime=dates[j]):
                        if q.__getattribute__('status') != '已审核':
                            models.Memory.objects.filter(userAccount=account, projectName=arrName[i], weekNumber=week,
                                                         saveTime=dates[j]).update(
                                timeLength=total[i][j], saveTime=dates[j], status='已保存')
                            # print('刷新项目')
                            # print()
                else:
                    # print('不存在')
                    # print()
                    leaderId = ''
                    type = ''
                    for id in models.Project.objects.filter(name=arrName[i]):
                        leaderId = id.__getattribute__('leaderId')
                        type = id.__getattribute__('type')
                    # print(leaderId,type)
                    models.Memory(userAccount=account, projectName=arrName[i], weekNumber=week, timeLength=total[i][j],
                                  saveTime=dates[j], submitTime=dates[j], status='已保存', leaderId=leaderId,
                                  type=type).save()
    return HttpResponse(0)
