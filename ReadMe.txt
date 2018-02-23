The Project Description:

Technology: ASP.net,C#, Dapper, Web Api, Angular 4

Database: Sql Server

Back End: C#,Web Api, Dapper

Front End: Angular 4

The project has 5 tier

PMSCommon -- database connectivity using dapper framework.
PMSModels -- custome models and request classes
PMSService -- work as data access tier and service layer
PMSApi -- work as business tier and provide api to client
PMSWeb -- Web application built in angular 4
 
Follow the below steps to run project

Step 1: By extracting the project, you will have PMS.sql which is database script.
	Open the sql server run the script , it will generate database, tables and enter dummy data.

Step 2:	Open PMS.sln file in visual studio, you require VS 2017 to run it.
	change in web.config file to connection string for your database.
	put your database connection string there.

Step 3: Run PMSApi

Step 4: Open PMSWeb in visual studio code, run npm install

Step 5: Change API url in app.config, replace your project url.

Step 6: type ng serve to run the web application 