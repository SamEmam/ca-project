FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install python:latest
RUN apt-get install pip:latest
RUN pip install Flask-SQLAlchemy:latest
RUN pip install Flask-WTF:latest
RUN git clone https://github.com/SamEmam/ca-project.git
RUN python ca-project/run.py

#CMD ["toilet", "-F border --gay"]