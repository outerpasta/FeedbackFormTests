#!/usr/bin/env bash
pybot ../form_tests
pybot --variable BROWSER:Chrome ../form_tests
pybot --variable BROWSER:Safari ../form_tests