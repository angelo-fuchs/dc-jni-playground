#!/bin/sh

CLASSPATH="src/main/java"

javac -cp "$CLASSPATH" src/main/java/*.java
javac -cp "$CLASSPATH" src/main/java/chat/delta/java/*.java


cd native_project/src/main/c/chat/delta/native

gcc \
dc_wrapper.c \
-I /usr/lib/jvm/java-8-openjdk/include -I /usr/lib/jvm/java-8-openjdk/include/linux/ \
-L libdeltachat.a -l:./libdeltachat.a \
-o ../../../../../target/libdeltajni.so -shared

cd ../../../../../../..
pwd

# package
mkdir -p target || true
rm target/* || true

cd src/main/java/
jar cf ../../target/deltachat.jar chat/delta/java/*.class
cd ../../..
cp native_project/target/libdeltajni.so target/libdeltajni.so
