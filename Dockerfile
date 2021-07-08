FROM python:3.7.3-slim-stretch

RUN apt-get update -y
RUN apt-get install wget python3 python3-pip python3-dev python-pip-whl -y
RUN pip install --upgrade pip
WORKDIR /app
ADD . /app
RUN pip3 install -r app/req3.txt
EXPOSE 5000
ENTRYPOINT ["python3"]
CMD ["/app/wsgi.py"]
