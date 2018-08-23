FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get install -y python3.6
RUN apt-get install -y python-pip

RUN pip install -r requirements.txt

RUN git clone https://github.com/SamEmam/ca-project.git
RUN python ca-project/run.py

#CMD ["toilet", "-F border --gay"]
