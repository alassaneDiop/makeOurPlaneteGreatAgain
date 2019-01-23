
FROM python:3.6


RUN apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean


RUN apt-get install -y python3-dev
RUN apt-get install -y default-libmysqlclient-dev
RUN apt-get install -y libffi-dev 
RUN apt-get install -y libxml2-dev 
RUN apt-get install -y libxslt-dev 
RUN apt-get install -y libjpeg-dev 
RUN apt-get install -y libfreetype6-dev 
RUN apt-get install -y zlib1g-dev 
RUN apt-get install -y net-tools 
RUN apt-get install -y vim
RUN apt-get install -y mysql-server python-mysqldb python-docutils
RUN apt-get install -y apache2 apache2-utils libapache2-mod-wsgi-py3




ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD ./requirements.txt /code/
ADD ./mysql-dump /code/
RUN pip install -r requirements.txt
RUN ls .
ADD ./makeOurPlanetGreatAgain/ /code/

# ENTRYPOINT [ "/bin/bash", "entrypoint.sh"]
# RUN ls /code/

# FROM mysql:5.7
# ADD dump.sql /docker-entrypoint/initdb.d/
# RUN ls /docker-entrypoint/initdb.d/


