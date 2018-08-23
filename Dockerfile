FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install python3.6
RUN apt-get install pip
RUN pip install Flask
RUN pip install Flask-SQLAlchemy
RUN pip install Flask-WTF
RUN git clone https://github.com/SamEmam/ca-project.git
RUN python ca-project/run.py

#CMD ["toilet", "-F border --gay"]