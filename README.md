# PhpTravels

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Notes](#notes)

## General info
This project aims to execute automated tests on www.phptravels.net.
## Technologies
Project is created with:
* Python version: 2.7.14
* Pip version: 9.0.1
* Robot framework version: 3.1.1
* robotframework-seleniumlibrary version: 3.3.1
* PyCharm IDE version: 2019.1.1

## Setup
Installation:
```
Requirements for installation:
having python and pip installed with the specified versions above.

Install robot framework
pip install robotframework

install selenium
pip install robotframework-seleniumlibrary

download web drivers for selenium
go to https://www.seleniumhq.org/download/
in third party drivers section download the driver according to the desired browser you need to run the scripts on
(Make sure the driver version is compatible with the installed browser version)

make web drivers are visible to the application
for windows:
go to advanced system settings
choose environment variables
edit the PATH environmental variable to include the path where the web drivers are located

for mac/linux:
sudo nano /etc/paths
add the path where the web drivers are located
enter CRTL+O
enter CTRL+X

```
Running:
```
Navigate to project folder
Run tests folder:
robot -d results -v BROWSER:browser_name -v GMAIL:gmail_address -v HOTMAIL:hotmail_address
-v YAHOO:yahoo_address tests
where:
browser_name = the browser to run the scripts on
(valid values: chrome, firefox, edge, ie, safari)
gmail_address = valid gmail address
hotmail_address = valid hotmail address
yahoo_address = valid yahoo address

example:
robot -d results -v BROWSER:chrome -v GMAIL:test@gmail.com -v HOTMAIL:test@hotmail.com
-v YAHOO:test@yahoo.com tests

* Note: Email addresses MUST be unique every time this command is executed.
```
## Notes

* Execution report can be found in Results > report.html.
* Screenshots for failures can be found in Results > Screenshots.
* Registration and Login test cases both can be found in Test_Cases file.
* The 2 test suites around 10 minutes to be executed as sometimes the website responds too late and failures cannot be fetched, So there are some pauses added to the suites to assure the response is received.
* Email addresses used in testing are given as arguments as there was no given access to the database to be able to clear it when needed. As a workaround, helper keywords has been implemented to generate new emails with each run of the scripts.
* The scripts support all browsers but Google Chrome is the guaranteed one to work probably. Please take into consideration that you may encounter some issues with other browsers as they need further configurations from the browser side.
