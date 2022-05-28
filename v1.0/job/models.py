from django.db import models
from django.contrib.auth.models import User



# Create your models here.
class StudentUser(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    mobile = models.CharField(max_length=10,null="True")
    image = models.FileField(null="True", max_length=512)
    gender = models.CharField(max_length=10,null="True")
    type = models.CharField(max_length=10,null="True")
    def __str__(self):
        return self.user.username
        

class Recureter(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    mobile = models.CharField(max_length=10,null="True")
    image = models.FileField(null="True", max_length=512)
    gender = models.CharField(max_length=10, null="True")
    company = models.CharField(max_length=50, null="True")
    type = models.CharField(max_length=10, null="True")
    status = models.CharField(max_length=20,null="True")

    def __str__(self):
        return self.user.username


class job(models.Model):
    recruiter = models.ForeignKey(Recureter,on_delete=models.CASCADE)
    start_date = models.DateField()
    end_date = models.DateField()
    title = models.CharField(max_length=10)
    salary = models.FloatField(max_length=50)
    image = models.FileField(max_length=512, null="True")
    Job_Description = models.CharField(max_length=200)
    Experience = models.CharField(max_length=10)
    Location = models.CharField(max_length=50)
    Skills = models.CharField(max_length=100)
    creationdate = models.DateField()

    def __str__(self):
        return self.title
