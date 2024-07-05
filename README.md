# PhpTravels

## Table of contents

* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)

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
run command
robot UserManagement.robot
```
