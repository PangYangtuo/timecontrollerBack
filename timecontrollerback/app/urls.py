from django.urls import re_path as url
from . import views

urlpatterns = {

    url("all/", views.get),
    url("searchUser/", views.searchUser),
    url("getWeekToday", views.getWeekToday),
    url('userSearchByApartment/', views.userSearchByApartment),
    url('getMemoryByAccount/', views.getMemoryByAccount),
    url('newMemory/', views.newMemory),
    url('changeMemory/', views.changeMemory),
    url('deleteMemory/', views.deleteMemory),
    url('getMemeoryTableByClickCandler/', views.getMemeoryTableByClickCandler),
    url('createNewUser/', views.createNewUser),
    url('changeUser/', views.changeUser),
    url('deleteUser/', views.deleteUser),
    url('reviewCreated/', views.reviewCreated),
    url('passReview/', views.passReview),
    url('backReview/', views.backReview),
    url('getUsersSelections/', views.getUsersSelections),
    url('createProject/', views.createProject),
    url('changeProject/', views.changeProject),
    url('allMemory/', views.allMemory),
    url('newIndex/', views.newIndex),
    url('newIndexSubmit/', views.newIndexSubmit),
    url('newIndexSave/', views.newIndexSave)
}
