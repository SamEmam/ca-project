FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get install -y python3.6
RUN apt-get install -y python-pip

RUN apt-get install -y git
RUN git clone https://github.com/SamEmam/ca-project.git

COPY . .

RUN pip install -r requirements.txt

WORKDIR ca-project/

EXPOSE 5000

CMD ["python", "run.py"]
