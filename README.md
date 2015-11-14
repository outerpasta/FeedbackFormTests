## Synopsis

Tests for Vacume Cleaner & Anvil Co. Feedback Form

![RUNNING](https://github.com/outerpasta/FeedbackFormTests/blob/master/demo/ScreenRec.gif)

![REPORT](https://github.com/outerpasta/FeedbackFormTests/blob/master/demo/Screen%20Shot%202015-11-13%20at%208.10.51%20PM.png)

## Installation

Requires python 2.7 - https://www.python.org/downloads/release/python-2710/

Install python dependencies:
```
$ cd FeedbackFormTests/
$ pip install -r requirements.txt
```
Or use Python Virtualenv
```
$ virtualenv tmp
$ ./tmp/bin/pip install -r requirements.txt
```
Then to execute tests:
```
$ ./tmp/bin/pybot form_tests/
$ ./tmp/bin/pybot --variable BROWSER:Chrome form_tests/  # Use Chromedriver
```
#### Chrome Setup
To run tests for Chrome browser ChromeDriver is required:
	https://code.google.com/p/selenium/wiki/ChromeDriver

#### Safari Setup
To run tests for Safari browser -

SafariDriver is required:
	https://code.google.com/p/selenium/wiki/SafariDriver
	
Download selenium-server-standalone-2.48.2.jar 
	http://www.seleniumhq.org/download/ 
	
Set Env value for SELENIUM_SERVER_JAR to path to selenium-server-standalone-2.48.2.jar 
```
$ export SELENIUM_SERVER_JAR=/path/to/selenium-server-standalone-2.48.2.jar
```

## Running

Run test for Firefox:
```
$ pybot form_tests/
```

Run test for each browser:
```
$ sh bin/allbrowsers.sh
```
or 
```
$ pybot form_tests/
$ pybot --variable BROWSER:Chrome form_tests/
$ pybot --variable BROWSER:Safari form_tests/
```