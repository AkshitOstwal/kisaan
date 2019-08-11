from django.views.generic import (TemplateView, View,ListView)
# from institution.models import Institution
# from django.contrib.auth import get_user_model
# from master.models import District
# from course.models import Course
# from accounts.views import InstitutionUtility
from .models import WaterLevel
from django.http import JsonResponse, HttpResponse
# from django.core import serializers
import django_tables2 as tables,itertools
# from django.views.decorators.csrf import csrf_exempt
# from django.utils.decorators import method_decorator
#
class WaterLevelTable(tables.Table):

    s_no = tables.Column(empty_values=(),verbose_name = "S.No.")
    # students_num = tables.Column(verbose_name='No. of Students')
    # city_name = tables.Column(verbose_name='City')
    # zonecode= tables.Column(verbose_name = "Zone")
    # districtcode= tables.Column(verbose_name = "District")
    # statecode= tables.Column(verbose_name = "State")

    def __init__(self, *args, **kwargs):
         super(WaterLevelTable, self).__init__(*args, **kwargs)
         self.counter = itertools.count(start=1)

    def render_s_no(self):
         return '%d' % next(self.counter)

    class Meta:
        model = WaterLevel
        exclude = ('id',)
        attrs={"class":"table dataTable-collapse text-center dataTable no-footer mt0"}
        sequence = ('s_no',)



class IndexView(tables.SingleTableMixin,ListView):
    table_class = WaterLevelTable
    template_name = 'dashboard/index.html'
    table_pagination = {
        'per_page' : 15
    }

    def get_queryset(self):

        return WaterLevel.objects.all()




    def get_context_data(self, **kwargs):
        """
        Overridden version of `.TemplateResponseMixin` to inject the table into
        the template's context.
        """
        context = super(tables.SingleTableMixin, self).get_context_data(**kwargs)
        table = self.get_table(**self.get_table_kwargs())
        context[self.get_context_table_name(table)] = table

        

        return context
#
# @method_decorator(csrf_exempt, name='dispatch')
# class GetDistrictsView(View):
#
#     def get(self,request):
#         queryset = District.objects.all()
#         data = serializers.serialize('json',queryset)
#         return HttpResponse(data,content_type='application/json')
#
# @method_decorator(csrf_exempt, name='dispatch')
# class SessionDistrict(View):
#
#     def post(self,request):
#         district_id = request.POST.get('district_id')
#         if district_id != '0':
#             request.session['district'] = district_id
#         else :
#             del request.session['district']
#
#         return HttpResponse(district_id)
