FROM oraclelinux:8.4 
LABEL name=ashutoshh
LABEL email=ashutoshh@linux.com 
RUN yum install java-11-openjdk.x86_64 java-11-openjdk-devel.x86_64 -y 
RUN mkdir /javacode 
COPY ashu.java /javacode/
ADD hello.java /javacode/
# copy and Add both are same while add can take input from URL also 
WORKDIR /javacode
RUN javac ashu.java && javac hello.java 
CMD ["java","hello"]
# having default process using CMD 