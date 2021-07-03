#!/bin/sh

CLASSPATH="src/java"

javac -cp "$CLASSPATH" src/java/*.java
javac -cp "$CLASSPATH" src/java/chat/delta/java/*.java


cd src/cpp/chat/delta/native

gcc \
dc_wrapper.c \
-I /usr/lib/jvm/java-8-openjdk/include -I /usr/lib/jvm/java-8-openjdk/include/linux/ \
-L libdeltachat.a -l:./libdeltachat.a \
-o libdeltajni.so -shared

cd ../../../../..

# package
mkdir -p target || true
rm target/* || true

cd src/java/
jar cf ../../target/deltachat.jar chat/delta/java/*.class
cd ../../
cp src/cpp/chat/delta/native/libdeltajni.so target/libdeltajni.so
