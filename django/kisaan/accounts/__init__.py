from django.contrib.auth.signals import user_logged_in
from django.dispatch import receiver


@receiver(user_logged_in)
def on_login(sender, user, request, **kwargs):
    try:
        if request.user.profile_belongs_to_user.user_type == 2:
            request.session['district']=request.user.profile_belongs_to_user.districtcode_id
    except:
        pass
