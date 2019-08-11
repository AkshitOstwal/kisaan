from django.db import models
import uuid

class WaterLevel(models.Model):
    id=models.UUIDField(default=uuid.uuid4(),primary_key=True)
    name = models.CharField(max_length=100)
    crop = models.CharField(max_length=100)
    temp = models.DecimalField(decimal_places=2,max_digits=4)
    humidity = models.DecimalField(decimal_places=2,max_digits=4)
    waterlevel = models.IntegerField()
    pressure  = models.DecimalField(decimal_places=2,max_digits=4)

    class Meta:
        db_table = "water_level"
