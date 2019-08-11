from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import (TemplateView, CreateView, ListView, UpdateView, DetailView, DeleteView)
from .forms import CreateStateForm, CreateZoneForm, CreateDistrictForm
from django.urls import reverse_lazy
from .models import State, Zone, District
import django_tables2 as tables
import datetime
from django.db import IntegrityError, transaction
from django.contrib.auth import get_user_model
import time, itertools
from datetime import datetime

class CreateState(SuccessMessageMixin,CreateView):

    form_class = CreateStateForm
    model = State
    success_url = reverse_lazy('master:list_state')
    success_message="State created Successfully"
    template_name = 'master/create_state.html'

    def form_valid(self, form):
         return super(CreateState,self).form_valid(form)


class StateTable(tables.Table):
    action = tables.TemplateColumn(template_name='master/table_columns/edit.html')


    s_no = tables.Column(empty_values=(),verbose_name = "S.No.")

    def render_s_no(self):
         self.row_counter = getattr(self, 'row_counter',
                                   itertools.count(self.page.start_index()))
         return next(self.row_counter)

    class Meta:
        model = State
        exclude = ('is_deleted',)
        attrs={"class":"table table-striped table-full"}
        sequence = ('s_no',)

class ListStateView(tables.SingleTableView):
    model = State
    table_class = StateTable
    queryset = State.objects.filter(is_deleted=0)
    template_name = 'master/list_state.html'

class UpdateStateView(UpdateView):
    model = State
    form_class = CreateStateForm
    template_name = 'master/update_state.html'
    success_message = "Updated Successfully"
    def get_success_url(self):
        return reverse_lazy('master:detail_state',args=(self.kwargs['pk'],))

class DetailStateView(DetailView):
    model = State
    fields = ('name','is_active')
    template_name = 'master/detail_state.html'

class DeleteStateView(DeleteView):
    model = State

    def get(self, *args, **kwargs):
        return self.post(*args, **kwargs)

    def get_success_url(self):
        return reverse_lazy('master:list_state')

    def delete(self, request, *args, **kwargs):
        """
        Call the delete() method on the fetched object and then redirect to the
        success URL.
        """
        self.object = self.get_object()
        success_url = self.get_success_url()
        self.object.is_deleted = 1
        self.object.save()
        return HttpResponseRedirect(success_url)




class CreateZone(SuccessMessageMixin,CreateView):

    form_class = CreateZoneForm
    model = Zone
    success_message="State created Successfully"
    template_name = 'master/zone/create_zone.html'

    def get_success_url(self):
        return reverse_lazy('master:list_zone',args=(self.kwargs['state_id'],))

    def form_valid(self, form):
        form.instance.statecode = State.objects.get(statecode = self.kwargs['state_id'])
        return super(CreateZone,self).form_valid(form)


class ZoneTable(tables.Table):
    action = tables.TemplateColumn(template_name='master/table_columns/zone/edit.html')


    s_no = tables.Column(empty_values=(),verbose_name = "S.No.")

    def render_s_no(self):
         self.row_counter = getattr(self, 'row_counter',
                                   itertools.count(self.page.start_index()))
         return next(self.row_counter)

    class Meta:
        model = Zone
        exclude = ('is_deleted',)
        attrs={"class":"table table-striped table-full"}
        sequence = ('s_no',)

class ListZoneView(tables.SingleTableView):
    model = Zone
    table_class = ZoneTable
    queryset = Zone.objects.filter(is_deleted=0,statecode__is_deleted=0)
    template_name = 'master/zone/list_zone.html'

class UpdateZoneView(UpdateView):
    model = Zone
    form_class = CreateZoneForm
    template_name = 'master/zone/update_zone.html'
    success_message = "Updated Successfully"
    def get_success_url(self):
        return reverse_lazy('master:detail_zone',args=(self.kwargs['pk'],self.kwargs['state_id']))

class DetailZoneView(DetailView):
    model = Zone
    fields = ('name','statecode','active')
    template_name = 'master/zone/detail_zone.html'

class DeleteZoneView(DeleteView):
    model = Zone

    def get(self, *args, **kwargs):
        return self.post(*args, **kwargs)

    def get_success_url(self):
        return reverse_lazy('master:list_zone')

    def delete(self, request, *args, **kwargs):
        """
        Call the delete() method on the fetched object and then redirect to the
        success URL.
        """
        self.object = self.get_object()
        success_url = self.get_success_url()
        self.object.is_deleted = 1
        self.object.save()
        return HttpResponseRedirect(success_url)

class CreateDistrict(SuccessMessageMixin,CreateView):

    form_class = CreateDistrictForm
    model = District
    success_message="District created Successfully"
    template_name = 'master/district/create_district.html'

    def get_success_url(self):
        return reverse_lazy('master:list_district',args=(self.kwargs['state_id'], self.kwargs['zone_id']))

    def form_valid(self, form):
        form.instance.statecode = State.objects.get(statecode = self.kwargs['state_id'])
        form.instance.zonecode = Zone.objects.get(zonecode = self.kwargs['zone_id'])
        return super(CreateDistrict,self).form_valid(form)


class DistrictTable(tables.Table):
    action = tables.TemplateColumn(template_name='master/table_columns/district/edit.html')


    s_no = tables.Column(empty_values=(),verbose_name = "S.No.")

    def render_s_no(self):
         self.row_counter = getattr(self, 'row_counter',
                                   itertools.count(self.page.start_index()))
         return next(self.row_counter)

    class Meta:
        model = District
        exclude = ('is_deleted',)
        attrs={"class":"table table-striped table-full"}
        sequence = ('s_no',)

class ListDistrictView(tables.SingleTableView):
    model = District
    table_class = DistrictTable
    queryset = District.objects.filter(is_deleted=0,statecode__is_deleted=0,zonecode__is_deleted=0)
    template_name = 'master/district/list_district.html'

class UpdateDistrictView(UpdateView):
    model = District
    form_class = CreateDistrictForm
    template_name = 'master/district/update_district.html'
    success_message = "Updated Successfully"
    def get_success_url(self):
        return reverse_lazy('master:detail_district',args=(self.kwargs['pk'],self.kwargs['state_id'],self.kwargs['zone_id']))

class DetailDistrictView(DetailView):
    model = District
    fields = ('name','statecode','zonecode','active')
    template_name = 'master/district/detail_district.html'

class DeleteDistrictView(DeleteView):
    model = District

    def get(self, *args, **kwargs):
        return self.post(*args, **kwargs)

    def get_success_url(self):
        state_id = District.objects.get(districtcode=self.kwargs['pk']).statecode
        zone_id = District.objects.get(districtcode=self.kwargs['pk']).zonecode
        return reverse_lazy('master:list_district',args=(state_id,zone_id))

    def delete(self, request, *args, **kwargs):
        """
        Call the delete() method on the fetched object and then redirect to the
        success URL.
        """
        self.object = self.get_object()
        success_url = self.get_success_url()
        self.object.is_deleted = 1
        self.object.save()
        return HttpResponseRedirect(success_url)
