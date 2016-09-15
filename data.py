
from faker import Factory

fake = Factory.create()




teamname = 'qateam4'





registerurl = 'http://www.pragger.com/register'
teamloginurl = 'http://www.pragger.com/login'
teamsubdomain = 'http://' + teamname + '.pragger.com'
teamdashboardurl = teamsubdomain + '/dashboard'
employeeadminurl = teamsubdomain + '/dashboard/admin_employees'


DICT__teamleaduser = {'teamname': teamname,
 'username': 'teamlead',
 'password': 'pass123'
}

LIST__employeelist = []

add_x_number_of_employees = 20

for x in range(1, add_x_number_of_employees):

   employeecode=fake.md5(raw_output=False)
   employeeusername=fake.first_name()
   empoloyeeemail=fake.email()
   employeepassword='pass123'
   employeefirstname=fake.first_name()
   employeelastname=fake.last_name()
   LIST__employeelist.append(employeecode+','+ employeeusername +','+empoloyeeemail+ ','+ employeepassword + ',' + employeefirstname + ',' + employeelastname)
			 
			 
			
			
