FROM oraclelinux:8.4
LABEL name=ashutoshh
LABEL email=ashutoshh@linux.com
ENV APP=web 
# creating an ENV variable with in the image with some default value 
RUN yum install httpd -y && mkdir -p /myapps/{webapp1,webapp2}
COPY project-html-website /myapps/webapp1/
ADD one-page-website-html-css-project  /myapps/webapp2/
COPY deploy.sh /myapps/
WORKDIR /myapps
RUN chmod +x deploy.sh
ENTRYPOINT ["./deploy.sh"]
# while creating container ENTRYPOINT argument is generally not replaceable like cmd
#CMD ["./deploy.sh"]