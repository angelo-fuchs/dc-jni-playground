#!/bin/sh
cd native_project
mvn install
cd ../java_project
mvn install
cd ..
