from django.urls import path, re_path
from django.conf.urls import url
from . import views

urlpatterns=[
    path('', views.PredictWaterLevel.as_view(), name='predict_waterlevel'),
    path('getwaterlevel', views.FetchWaterLevel.as_view(), name='fetch_waterlevel'),
    ]
