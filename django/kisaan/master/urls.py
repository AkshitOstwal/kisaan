from django.urls import path
from . import views
from django.contrib.auth.decorators import login_required

app_name = 'master'

urlpatterns = [
    path('create-state/',login_required(views.CreateState.as_view()),name='create_state'),
    path('list-state/',login_required(views.ListStateView.as_view()),name='list_state'),
    path('update-state/<str:pk>/',login_required(views.UpdateStateView.as_view()),name='update_state'),
    path('detail-state/<str:pk>/',login_required(views.DetailStateView.as_view()),name='detail_state'),
    path('delete-state/<str:pk>/',login_required(views.DeleteStateView.as_view()),name='delete_state'),
    path('create-zone/<str:state_id>',login_required(views.CreateZone.as_view()),name='create_zone'),
    path('list-zone/<str:state_id>',login_required(views.ListZoneView.as_view()),name='list_zone'),
    path('update-zone/<str:pk>/<str:state_id>',login_required(views.UpdateZoneView.as_view()),name='update_zone'),
    path('detail-zone/<str:pk>/<str:state_id>',login_required(views.DetailZoneView.as_view()),name='detail_zone'),
    path('delete-zone/<str:pk>/',login_required(views.DeleteZoneView.as_view()),name='delete_zone'),
    path('create-district/<str:state_id>/<str:zone_id>',login_required(views.CreateDistrict.as_view()),name='create_district'),
    path('list-district/<str:state_id>/<str:zone_id>',login_required(views.ListDistrictView.as_view()),name='list_district'),
    path('update-district/<str:pk>/<str:state_id>/<str:zone_id>',login_required(views.UpdateDistrictView.as_view()),name='update_district'),
    path('detail-district/<str:pk>/<str:state_id>/<str:zone_id>',login_required(views.DetailDistrictView.as_view()),name='detail_district'),
    path('delete-district/<str:pk>/',login_required(views.DeleteDistrictView.as_view()),name='delete_district'),


]
