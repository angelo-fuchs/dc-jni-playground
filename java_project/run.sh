mvn clean install
cd target
java -cp JNI-1.56-SNAPSHOT.jar -Djava.library.path=../../native_project/target/  DCTest
cd ..
