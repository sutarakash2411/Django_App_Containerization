## Using official ubuntu base image
FROM ubuntu:latest

##setting up the working dir
WORKDIR /app

##Copying the Django Project Files
COPY . /app/

## Installing python and pip3
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean

##creating a virtual env
RUN python3 -m venv /app/venv

##installing dependencies inside virtual env
RUN /app/venv/bin/pip3 install -r requirements.txt

ENTRYPOINT [ "/app/venv/bin/python3" ]
CMD [ "manage.py","runserver", "0.0.0.0:8000" ]

