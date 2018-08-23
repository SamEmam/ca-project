FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get install -y python3.6
RUN apt-get install -y python-pip

Workdir /dist
COPY . .

RUN pip install -r requirements.txt

EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD ["run.py"]
