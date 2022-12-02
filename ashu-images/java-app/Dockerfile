FROM openjdk
# we are refering to jdk support by above image 
LABEL name=ashutoshh
LABEL email=ashutoshh@linux.com 
# optional field but image developer info 
RUN mkdir /mycode 
# RUN can give shell access while image building 
COPY ashu.java /mycode/
# copy code from docker client to newly created image during image build time
WORKDIR /mycode
# use to change directory while image build process
RUN javac ashu.java 
# using javac to compile code 
CMD ["java","ashu"]
# setting parent process for this image 
# can be replaced by user while creating container 
