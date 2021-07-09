FROM python:3.7.3-slim-stretch

RUN apt-get update -y
RUN apt-get install  python3 python3-pip python3-dev python-pip-whl wget -y
RUN pip install --upgrade pip
RUN mkdir -p /images/
WORKDIR /app
COPY . /app
RUN pip3 install -r app/req3.txt
EXPOSE 5000
ENTRYPOINT ["python3"]
CMD ["/app/wsgi.py"]
