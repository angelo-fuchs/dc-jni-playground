#!/bin/sh
cd java_project
mvn clean install
cd ../native_project
mvn clean install
cd ..
