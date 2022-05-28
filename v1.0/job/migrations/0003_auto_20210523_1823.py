# Generated by Django 3.2.2 on 2021-05-23 12:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('job', '0002_recureter'),
    ]

    operations = [
        migrations.RenameField(
            model_name='recureter',
            old_name='useer',
            new_name='user',
        ),
        migrations.CreateModel(
            name='job',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('start_date', models.DateField()),
                ('end_date', models.DateField()),
                ('title', models.CharField(max_length=10)),
                ('salary', models.FloatField(max_length=50)),
                ('image', models.FileField(max_length=10, null='True', upload_to='')),
                ('Job_Description', models.CharField(max_length=200)),
                ('Experience', models.CharField(max_length=10)),
                ('Location', models.CharField(max_length=50)),
                ('Skills', models.CharField(max_length=100)),
                ('creationdate', models.DateField()),
                ('recruiter', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='job.recureter')),
            ],
        ),
    ]