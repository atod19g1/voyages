REM lancer si besoin le service mysql (net start mysql)
set MYSQL_HOME=C:\Program Files (x86)\MySQL\MySQL Server 5.1
cd /d %~dp0
"%MYSQL_HOME%\bin\mysql"  -u root -p < crebas.sql
pause