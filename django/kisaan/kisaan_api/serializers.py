from rest_framework import serializers
from dashboard.models import WaterLevel

class WaterLevelSerializer(serializers.ModelSerializer):


    class Meta:
        model = WaterLevel
        fields=('id','name','crop','temp','pressure','humidity',)

class FetchWaterLevelSerializer(serializers.ModelSerializer):


    class Meta:
        model = WaterLevel
        fields=('name','crop','temp','pressure','humidity','waterlevel')
