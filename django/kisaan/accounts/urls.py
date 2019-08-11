from django.urls import path, include, reverse_lazy
from . import views
from django.contrib.auth.decorators import login_required

from django.contrib.auth import views as auth_views

# SET THE NAMESPACE!
app_name = 'accounts'

urlpatterns = [
    path('signup/',views.SignupView.as_view(),name='signup'),
    path('password-change/', auth_views.PasswordChangeView.as_view(template_name='auth/change_password.html'), name='change_password'),
    path('login/', auth_views.LoginView.as_view(template_name='auth/login.html',success_url=reverse_lazy('accounts:index'),redirect_authenticated_user=True), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page=reverse_lazy('accounts:login')), name='logout'),
    path('password_reset/', auth_views.PasswordResetView.as_view(template_name='auth/password_reset.html', email_template_name='auth/email/password_reset_email.txt',success_url=reverse_lazy('accounts:password_reset_sent')), name='password_reset'),
    path('password_reset/done/', auth_views.PasswordResetDoneView.as_view(template_name='auth/password_reset_sent.html'), name='password_reset_sent'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='auth/password_reset_confirm.html',success_url=reverse_lazy('accounts:password_reset_complete')), name='password_reset_confirm'),
    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(template_name='auth/password_reset_complete.html'), name='password_reset_complete'),

]
