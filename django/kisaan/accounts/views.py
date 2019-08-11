from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.views.generic import (TemplateView, CreateView, View)
from .forms import SignupForm
from django.urls import reverse_lazy


class SignupView(CreateView):

    form_class = SignupForm
    success_url = reverse_lazy('accounts:login')
    template_name = 'auth/signup.html'

    def form_valid(self, form):

        self.object = form.save()
        self.object.set_password(form.instance.password);
        self.object.save()

        return HttpResponseRedirect(self.get_success_url())
