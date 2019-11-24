@echo off
echo #########################################################################
echo # title       : generate app in mvc archetecture in flask               #
echo # version     : 0.1.0                                                   #
echo # author      : zediek villamil                                         #
echo # supported os: windows 10, i don't know if it works in windows 7 and 8 #
echo # requirements: python 3.7.2                                            #
echo #               pip3 or pip not pip2 if not included in python3         #
echo #               vertualenv in pip install                               #
echo #########################################################################
set /p projectname="Project Name>"
mkdir %projectname%"_app"
cd %projectname%"_app"
virtualenv env
cd env/Scripts
call pip3.exe install flask
call pip3.exe install flask-sqlalchemy
call pip3.exe install flask-wtf
call pip3.exe install flask-mail
call pip3.exe install PyMySQL
call pip3.exe install validate_email
call pip3.exe install werkzeug
cd ../..
echo creating run.py....
echo # Run a test server >> run.py
echo from flask import Flask >> run.py
echo from %projectname%.app import app >> run.py
echo if __name__ == '__main__': >> run.py
echo 	app.run(host='0.0.0.0',debug=True) >> run.py
echo run.py created
echo creating config.py....
echo # Statement for enable the development environment >> config.py
echo DEBUG = True # Turns on debugging features in Flask >> config.py
echo # Define the database - we are working with >> config.py
echo # MySql >> config.py
echo # SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:@localhost/%projectname%' >> config.py
echo SECRET_KEY = 'secret' >> config.py
echo config.py created
mkdir %projectname%
cd %projectname%
echo creating __init__.py....
echo # >> __init__.py
echo __init__.py created
echo creating app.py....
echo from flask import Flask, Blueprint >> app.py
echo app = Flask('%projectname%') >> app.py
echo app.config.from_object('config') >> app.py
echo app.config.from_pyfile('../config.py') >> app.py
echo page = Blueprint('page', __name__, template_folder='views/templates',static_folder='views/static', static_url_path='/views/static') >> app.py
echo app.register_blueprint(page) >> app.py
echo from %projectname%.controllers import %projectname%_controller >> app.py
mkdir controllers
cd controllers
echo creating __init__.py....
echo # >> __init__.py
echo __init__.py created
echo creating %projectname%_controller.py....
echo from flask import Flask, render_template >> %projectname%_controller.py
echo from %projectname%.app import app >> %projectname%_controller.py
echo @app.route('/') >> %projectname%_controller.py
echo @app.route('/%projectname%') >> %projectname%_controller.py
echo def %projectname%(): >> %projectname%_controller.py
echo 	return render_template('%projectname%/index.html') >> %projectname%_controller.py
echo %projectname%_controller.py created
cd ..
mkdir models
cd models
echo creating __init__.py....
echo # >> __init__.py
echo __init__.py created
cd ..
mkdir views
cd views
mkdir templates
cd templates
mkdir %projectname%
cd %projectname%
echo creating index.html....
echo this is %projectname% page >> index.html
echo index.html created
cd ../..
mkdir static
cd ../../env/Scripts
call activate.bat
cd ../..
start http:/localhost:5000/%projectname%
python run.py
pause