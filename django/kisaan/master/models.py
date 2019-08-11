from django.db import models

# Create your models here.


class State(models.Model):

    ACTIVE_CHOICES = (
        (0,'Inactive'),
        (1, 'Active'),
    )

    statecode = models.CharField(max_length=2, unique=True, primary_key=True)
    name = models.CharField(max_length=50)
    active = models.IntegerField(choices=ACTIVE_CHOICES)
    is_deleted = models.BooleanField(default=False)

    def __str__(self):
        # Built-in attribute of django.contrib.auth.models.User !
        return self.name

    class Meta:
        db_table = "master_state"



class Zone(models.Model):

    ACTIVE_CHOICES = (
        (0,'Inactive'),
        (1, 'Active'),
    )
    zonecode = models.CharField(max_length=4, unique=True, primary_key=True)
    statecode = models.ForeignKey(State, related_name="zone_belongs_to_state", on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    active = models.IntegerField(choices=ACTIVE_CHOICES)
    is_deleted = models.BooleanField(default=False)

    def __str__(self):
        # Built-in attribute of django.contrib.auth.models.User !
        return self.name

    class Meta:
        db_table = "master_zone"


class District(models.Model):

    ACTIVE_CHOICES = (
        (0,'Inactive'),
        (1, 'Active'),
    )
    districtcode = models.CharField(max_length=4, unique=True, primary_key=True)
    statecode = models.ForeignKey(State, related_name="district_belongs_to_state", on_delete=models.CASCADE)
    zonecode = models.ForeignKey(Zone, related_name="district_belongs_to_zone", on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    active = models.IntegerField(choices=ACTIVE_CHOICES)
    is_deleted = models.BooleanField(default=False)

    def __str__(self):
        # Built-in attribute of django.contrib.auth.models.User !
        return self.name

    class Meta:
        db_table = "master_district"

class Language(models.Model):
    id = models.CharField(max_length=2, unique=True, primary_key=True)
    name = models.CharField(max_length=5)
    timecreated = models.IntegerField()
    timemodified = models.IntegerField()

    def __str__(self):
        # Built-in attribute of django.contrib.auth.models.User !
        return self.name

    class Meta:
        db_table = "languages"
