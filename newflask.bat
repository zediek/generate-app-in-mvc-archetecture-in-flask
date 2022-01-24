@echo off
echo #########################################################################
echo # title       : NewFlask: Generate App in MVC Architecture in Flask     #
echo # version     : 0.5.1                                                   #
echo # author      : zediek villamil                                         #
echo # supported os: Windows 10, i don't know if it works in windows 7 and 8 #
echo # requirements: Pip 20.3.3 Python 3.7.2                                 #
echo #               pip3 or pip not pip2 if not included in python3         #
echo #               vertualenv in pip install                               #
echo #               yarn to install bootstrap                               #
echo #########################################################################
set /p projectname="Project Name>"
set /p author="Author>"
set year=%date:~6,4%
mkdir %projectname%
cd %projectname%
virtualenv env
cd env/Scripts
call pip3.exe install flask
call pip3.exe install flask-sqlalchemy
call pip3.exe install flask-wtf
call pip3.exe install flask-mail
call pip3.exe install flask_socketio
call pip3.exe install PyMySQL
call pip3.exe install validate_email
call pip3.exe install werkzeug
call pip3.exe install waitress
cd ../..
echo creating readme.txt....
echo # First. Type command 'pip install -r requirements.txt' >> readme.txt
echo # To run the system. Type command 'python run.py' >> readme.txt
echo readme.txt created
echo creating requirements.txt....
echo flask >> requirements.txt
echo flask-sqlalchemy >> requirements.txt
echo flask-wtf >> requirements.txt
echo flask-mail >> requirements.txt
echo flask_socketio >> requirements.txt
echo PyMySQL >> requirements.txt
echo validate_email >> requirements.txt
echo werkzeug >> requirements.txt
echo waitress >> requirements.txt
echo requirements.txt created
echo creating run.py....
echo # Run a test server >> run.py
echo from flask import Flask >> run.py
echo from src.app import app >> run.py
echo debug_status = True >> run.py
echo project_name = ^"%projectname%^" >>run.py
echo author = ^"%author%^" >> run.py
echo __version__ = ^"v0.0.0^" >> run.py
echo if __name__ == '__main__': >> run.py
echo print(f^"Welcome to {project_name}{__version__}^") >> run.py
echo print(^"(c) %year% %author%. All Rights Reserved.^") run.py
echo 	import logging >> run.py
echo 	logging.basicConfig(filename='logs.log',level=logging.DEBUG) >> run.py
echo 	if debug_status: >> run.py
echo 		app.run(host='0.0.0.0',debug=True) >> run.py
echo 	else: >> run.py
echo 		from waitress import serve >> run.py
echo 		serve(app,host='0.0.0.0',port=5000) >> run.py
echo run.py created
echo creating config.py....
echo import os >> config.py
echo # Statement for enable the development environment >> config.py
echo DEBUG = True # Turns on debugging features in Flask >> config.py
echo # Define the database - we are working with >> config.py
echo # MySql >> config.py
echo # SQLALCHEMY_DATABASE_URI = f'mysql+pymysql://[mysqluser]:[mysqlpass]@locahost/%projectname%' >> config.py
echo # SQLALCHEMY_TRACK_MODIFICATIONS = False >> config.py
echo SECRET_KEY = str(os.urandom(24).hex()) >> config.py
echo config.py created
echo creating zedgen.py....
echo import argparse >> zedgen.py
echo import platform >> zedgen.py
echo import os >> zedgen.py
echo module_name = ^"ZedGen: Flask's generate pages, models or services.^" >> zedgen.py
echo author = ^"Zediek^" >> zedgen.py
echo __version__ = ^"0.1.0^" >> zedgen.py
echo version_string = f^"%(prog)s {__version__}\n^" + f^"Python:  {platform.python_version()}^" >> zedgen.py
echo parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,description=f^"{module_name} (Version {__version__}) By: {author}^") >> zedgen.py
echo parser.add_argument(^"--version^", ^"-v^", action=^"version^",  version=version_string,help=^"Display version information and dependencies^") >> zedgen.py
echo parser.add_argument(^"--page^", ^"-p^", action=^"store^", type=str, required=False, help=^"generate controller and view file^") >> zedgen.py
echo parser.add_argument(^"--model^", ^"-m^", action=^"store^", type=str, required=False, help=^"generate model file^") >> zedgen.py
echo parser.add_argument(^"--service^", ^"-s^", action=^"store^", type=str, required=False, help=^"generate service file^") >> zedgen.py
echo args = parser.parse_args() >> zedgen.py
echo if args.page != None: >> zedgen.py
echo 	file = open(f^"src/controllers/{args.page}_controller.py^",'a') >> zedgen.py
echo 	string = ^"from flask import render_template\n^" >> zedgen.py
echo 	string += ^"from src.app import app\n^" >> zedgen.py
echo 	string += f^"@app.route('/{args.page}')\n^"  >> zedgen.py 
echo 	string += f^"def {args.page}():\n^" >> zedgen.py
echo 	string += f^"	return render_template('{args.page}/index.html')\n^" >> zedgen.py
echo 	file.write(string) >> zedgen.py
echo 	file.close() >> zedgen.py
echo 	if not os.path.exists(f^"src/views/templates/{args.page}^"): >> zedgen.py
echo 		os.makedirs(f^"src/views/templates/{args.page}^") >> zedgen.py
echo 	file = open(f^"src/views/templates/{args.page}/index.html^",'a') >> zedgen.py
echo 	string = f^"This is {args.page} page.^" >> zedgen.py
echo 	file.write(string) >> zedgen.py
echo 	file.close() >> zedgen.py
echo 	file = open(f^"src/app.py^",'a') >> zedgen.py
echo 	string = f^"from src.controllers import {args.page}_controller\n^" >> zedgen.py
echo 	file.write(string)  >> zedgen.py
echo 	file.close() >> zedgen.py
echo if args.model != None: >> zedgen.py
echo 	file = open(f^"src/models/{args.model}_model.py^",'a') >> zedgen.py
echo 	string = ^"from src.app import db\n^" >> zedgen.py
echo 	string += f^"class {str(args.model).capitalize()}(db.Model):\n^"  >> zedgen.py 
echo 	string += f^"	def __init__(self):\n^" >> zedgen.py
echo 	string += f^"		pass\n^" >> zedgen.py
echo 	file.write(string) >> zedgen.py
echo 	file.close() >> zedgen.py
echo if args.service != None: >> zedgen.py
echo 	if not os.path.exists(f^"src/services^"): >> zedgen.py
echo 		os.makedirs(f^"src/services^") >> zedgen.py
echo 	file = open(f^"src/services/{args.service}_service.py^",'a') >> zedgen.py
echo 	string = f^"class {str(args.service).capitalize()}:\n^" >> zedgen.py
echo 	string += f^"	pass\n^" >> zedgen.py
echo 	file.write(string) >> zedgen.py
echo 	file.close() >> zedgen.py
echo zedgen.py created
mkdir src
cd src
echo creating __init__.py....
echo # >> __init__.py
echo __init__.py created
echo creating app.py....
echo from flask import Flask, Blueprint >> app.py
echo app = Flask('src') >> app.py
echo app.config.from_object('config') >> app.py
echo app.config.from_pyfile('../config.py') >> app.py
echo page = Blueprint('page', __name__, template_folder='views/templates',static_folder='views/static', static_url_path='/views/static') >> app.py
echo app.register_blueprint(page) >> app.py
echo from src.controllers import %projectname%_controller >> app.py
echo app.py created
mkdir controllers
cd controllers
echo creating __init__.py....
echo # >> __init__.py
echo __init__.py created
echo creating %projectname%_controller.py....
echo from flask import render_template >> %projectname%_controller.py
echo from src.app import app >> %projectname%_controller.py
echo @app.route('/') >> %projectname%_controller.py
echo @app.route('/%projectname%') >> %projectname%_controller.py
echo def %projectname%(): >> %projectname%_controller.py
echo 	return render_template('index.html') >> %projectname%_controller.py
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
mkdir static
cd static
start download_bootstrap.bat
timeout /t 5 /nobreak > NUL
cd ..
mkdir templates
cd templates
echo creating index.html....
echo ^<!DOCTYPE html^> >> index.html
echo ^<html lang=^"en^" class=^"h-100^"^> >> index.html
echo    ^<head^> >> index.html
echo        ^<meta charset=^"utf-8^"^> >> index.html
echo        ^<meta name=^"viewport^" content=^"width=device-width, initial-scale=1, shrink-to-fit=no^"^> >> index.html
echo        ^<link rel=^"stylesheet^" type=^"text/css^" href=^"{{ url_for(^'page.static^', filename = ^'node_modules/bootstrap/dist/css/bootstrap.min.css^') }}^"^> >> index.html
echo        ^<title^>%projectname%^</title^> >> index.html
echo    ^</head^> >> index.html
echo    ^<body class=^"d-flex flex-column h-100^"^> >> index.html
echo        ^<div class=^"container^"^> >> index.html
echo            ^<div class=^"card^"^> >> index.html
echo                ^<h1 class=^"card-header^"^>Welcome To Zediek's NewFlask: Generate App in MVC Archetecture in Flask^</h1^> >> index.html
echo                ^<div class=^"card-body^"^> >>index.html
echo                    ^<p class=^"card-text^"^>This is %projectname% page is generated from NewFlask created by Zediek Villamil^</p^> >> index.html
echo                ^</div^> >> index.html
echo            ^</div^> >> index.html
echo        ^</div^> >> index.html
echo        ^<footer class=^"footer mt-auto py-3 bg-light text-center^" style=^"margin-top: 5%;^"^> >> index.html
echo            ^<div class=^"container^"^> >> index.html
echo                ^<span class=^"text-muted^"^> >> index.html
echo                    ^&#9400; %year% %author%. All Rights Reserved. >> index.html
echo                ^</span^> >> index.html
echo            ^</div^> >> index.html
echo        ^</footer^> >> index.html
echo        ^<script src=^"{{ url_for(^'page.static^', filename = ^'node_modules/bootstrap/dist/js/bootstrap.min.js^') }}^"^>^</script^> >> index.html
echo    ^</body^> >> index.html
echo ^</html^> >> index.html
echo index.html created
cd ..
cd ../../env/Scripts
call activate.bat
cd ../..
start http:/localhost:5000/%projectname%
python run.py
pause
