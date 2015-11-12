## Synopsis

Tests for Vacume Cleaner & Anvil Co. Feedback Form

## Installation

Requires python 2.7!

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

## Running

Run test for Firefox:
```
$ pybot form_tests/
```

Run test for each browser:
```
$ sh bin/allbrowsers.sh
```