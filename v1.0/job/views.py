from django.shortcuts import render, redirect
from .models import *
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from datetime import date


# Create your views here.
def index(request):
    return render(request, "index.html")


def admin_login(request):
    error = ""
    if request.method == 'POST':
        u = request.POST['uname']
        p = request.POST['pwd']
        user = authenticate(username=u, password=p)
        if user:
            try:
                if user.is_staff:
                    login(request, user)
                    error = "no"
                else:
                    error = "yes"
            except:
                error = "yes"
    d = {'error': error}
    return render(request, "admin_login.html", d)


def user_login(request):
    error = ""
    if request.method == 'POST':
        u = request.POST['uname']
        p = request.POST['pwd']
        user = authenticate(username=u, password=p)
        if user:
            try:
                user1 = StudentUser.objects.get(user=user)
                if user1.type == "student":
                    login(request, user)
                    error = "no"
                else:
                    error = "yes"
            except:
                error = "yes"
        else:
            error = "yes"
    d = {'error': error}
    return render(request, "user_login.html", d)


def recureter_login(request):
    error = ""
    if request.method == 'POST':
        u = request.POST['uname']
        p = request.POST['pwd']
        user = authenticate(username=u, password=p)
        if user:
            try:
                user1 = Recureter.objects.get(user=user)
                if user1.type == "recureter" and user1.status != "pending":
                    login(request, user)
                    error = "no"
                else:
                    error = "not"
            except:
                error = "yes"
        else:
            error = "yes"
    d = {'error': error}
    return render(request, "recureter_login.html", d)


def recureter_signup(request):
    error = ""
    if request.method == 'POST':
        f = request.POST['fname']
        l = request.POST['lname']
        # i = request.POST['image']
        i = 'image'
        p = request.POST['pwd']
        con = request.POST['contact']
        e = request.POST['email']
        company = request.POST['company']
        gen = request.POST['gender']
        try:
            user = User.objects.create_user(first_name=f, last_name=l, username=e, passsword=p)
            Recureter.objects.create(user=user, mobile=con, image=i, gender=gen, company=company, type="recureter",
                                     status="pending")
            error = "no"
        except:
            error = "yes"
    d = {"error": error}
    return render(request, "recureter_signup.html", d)


def recureter_home(request):
    if not request.user.is_authenticated:
        return redirect('recureter_login')
    return render(request, "recureter_home.html")


def user_signup(request):
    error = ""
    if request.method == 'POST':
        f = request.POST['fname']
        l = request.POST['lname']
        i = request.FILES['image']
        p = request.POST['pwd']
        e = request.POST['email']
        con = request.POST['contact']
        gen = request.POST['gender']
        try:
            user = User.objects.create_user(first_name=f, last_name=l, username=e, password=p)
            StudentUser.objects.create(user=user, mobile=con, image=i, gender=gen, type='student')
            error = "No"
        except:
            error = "yes"
    d = {'error': error}
    return render(request, "user_signup.html", d)


def user_home(request):
    if not request.user.is_authenticated:
        return redirect('user_login')
    return render(request, "user_home.html")


def logout(request):
    logout(request)
    return redirect('index')


def admin_home(request):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    return render(request, 'admin_home.html')


def recruiter_home(request):
    if not request.user.is_authenticated:
        return redirect('recruiter_login')
    return render(request, 'recruiter_home.html')


def view_users(request):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    data = StudentUser.objects.all()
    d = {'data': data}
    return render(request, 'view_users.html', d)


def delete_user(request, pid):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    recruiter = User.objects.get(id=pid)
    recruiter.delete()
    return redirect('recruiter_all')


def recruiter_pending(request):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    data = Recureter.objects.filter(status="pending")
    d = {'data': data}
    return render(request, 'recruiter_pending.html', d)


def recruter_accepted(request):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    data = Recureter.objects.filter(status="Accept")
    d = {'data': data}
    return render(request, 'recruter_accepted.html', d)


def recruiter_rejected(request):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    data = Recureter.objects.filter(status="Reject")
    d = {'data': data}
    return render(request, 'recruiter_rejected.html', d)


def recruiter_all(request):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    data = Recureter.objects.all()
    d = {'data': data}
    return render(request, 'recruiter_all.html', d)


def delete_recruiter(request, pid):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    student = User.objects.get(id=pid)
    student.delete()
    return redirect('view_users')


def change_status(request):
    if not request.user.is_authenticated:
        return redirect('admin_login')
    error = ""
    recruiter = Recureter.objects.get(id="pid")
    if request.method == 'POST':
        s = request.POST['status']
        recruiter.status = s
        try:
            recruiter.save()
            error = "no"
        except:
            error = "yes"
    d = {'recruiter': recruiter, 'error': error}
    return render(request, 'change_status.html', d)


def add_job(request):
    if not request.user.is_authenticated:
        return redirect('recruiter_login')
    error = ""
    if request.method == 'POST':
        jt = request.POST['jobtitle']
        sd = request.POST['startdate']
        ed = request.POST['enddate']
        sal = request.POST['salary']
        l = request.FILES['logo']
        exp = request.POST['experience']
        loc = request.POST['location']
        skills = request.POST['skills']
        des = request.POST['description']
        user = request.user
        recruiter = Recureter.objects.get(user=user)
        try:
            job.objects.create(recruiter=recruiter, start_date=sd, end_date=ed, title=jt, salary=sal, image=l,
                               description=des, experience=exp, location=loc, skills=skills,creationdate=date.today())
            error="no"
        except:
            error="yes"
    d={'error':error}
    return render(request, "add_job.html",d)


def job_list(request):
    if not request.user.is_authenticated:
        return redirect('recureter_login')
    user = request.user
    recruiter = Recureter.objects.get(user=user)
    job = Job.objects.filter(recruiter=recruiter)
    d = {'job':job}
    return render(request, "job_list.html",d)



def edit_jobdetail(request):
    if not request.user.is_authenticated:
        return redirect('recruiter_login')
    error = ""
    job = Job.objects.get(id=pid)
    if request.method == 'POST':
        jt = request.POST['jobtitle']
        sd = request.POST['startdate']
        ed = request.POST['enddate']
        sal = request.POST['salary']
        l = request.FILES['logo']
        exp = request.POST['experience']
        loc = request.POST['location']
        skills = request.POST['skills']
        des = request.POST['description']
        user = request.user
        recruiter = Recureter.objects.get(user=user)
        try:
            job.objects.create(recruiter=recruiter, start_date=sd, end_date=ed, title=jt, salary=sal, image=l,
                               description=des, experience=exp, location=loc, skills=skills,creationdate=date.today())
            error="no"
        except:
            error="yes"
    d={'error':error,'job':job}
    return render(request, "edit_jobdetail.html",d)