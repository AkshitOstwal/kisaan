from django.shortcuts import render
from rest_framework.permissions import IsAuthenticated,AllowAny
from .serializers import WaterLevelSerializer, FetchWaterLevelSerializer
from rest_framework.generics import ListAPIView,CreateAPIView
from dashboard.models import WaterLevel
from rest_framework.views import APIView
from decimal import *
import uuid
from rest_framework.response import Response
from rest_framework import status

class PredictWaterLevel(APIView):
    permission_classes = (AllowAny,)
    serializer_class = WaterLevelSerializer

    def post(self, request):
        serializer = WaterLevelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        temp = request.data['temp']
        humidity = request.data['humidity']
        pressure = request.data['pressure']
        id=uuid.uuid4();
        serializer.save(id=id,waterlevel=self.trainmodel(temp,humidity,pressure))
        serializer.save(waterlevel=self.trainmodel(temp,humidity,pressure))
        return Response(serializer.data,status=status.HTTP_201_CREATED)

    def trainmodel(self,temp,humidity,pressure):


    # coding: utf-8

    # # Water Crisis

    # In[1]:


        import pandas as pd


        # In[2]:


        import numpy as np


        # In[3]:


        df=pd.read_csv("/home/codeforvision/weatherHistory.csv")


        # In[4]:


        a=np.random.randint(20,8000,96453)


        # In[5]:


        b=pd.DataFrame(a)


        # In[6]:


        df1=pd.concat([df,b],axis=1)


        # In[7]:


        df1.rename(columns={0: "water level quantity (cm^3)"})


        # In[8]:


        features=df1.iloc[:5000,[3,5,10]].values
        labels=df1.iloc[:5000,-1].values


        # In[9]:


        #Spliting the dataset into training and testing set

        from sklearn.model_selection import train_test_split
        x_train,x_test,y_train,y_test=train_test_split(features,labels,test_size=0.10,random_state=0)


        # In[10]:


        #Features scaling
        from sklearn.preprocessing import StandardScaler
        sc=StandardScaler()
        x_train=sc.fit_transform(x_train)
        x_test=sc.transform(x_test)


        # In[11]:


        #Fitting the multiple linear regression to training set
        from sklearn.linear_model import LinearRegression
        regressor=LinearRegression()
        regressor.fit(x_train,y_train)



        # In[12]:


        y=regressor.predict([[int(temp),int(humidity),int(pressure)]])
        return int(y[0])


class FetchWaterLevel(ListAPIView):
    permission_classes = (AllowAny,)
    serializer_class = FetchWaterLevelSerializer

    def get_queryset(self):

        return WaterLevel.objects.filter(id=self.request.POST.get('id'))
