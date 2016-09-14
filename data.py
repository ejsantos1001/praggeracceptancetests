
from faker import Factory

fake = Factory.create()


teamname = 'qateam4'

registerurl = 'http://www.pragger.com/register'
teamloginurl = 'http://www.pragger.com/login'
teamsubdomain = 'http://' + teamname + '.pragger.com'
teamdashboardurl = teamsubdomain + '/dashboard'
employeeadminurl = teamsubdomain + '/dashboard/admin_employees'


DICT__teamleaduser = {
	'teamname' : teamname,
	'username' : 'teamlead',
	'password' : 'pass123'
}


DICT__employeedatagen = {
	'employeecode' : fake.md5(raw_output=False),
	'username' : fake.name(),
	'email' : fake.email(),
	'password' : 'pass123',
	'firstname' : fake.first_name(),
	'lastname'	: fake.last_name()
}