FROM python:3.7.3-slim-stretch
VOLUME /app 
VOLUME /images
RUN apt-get update -y
RUN apt-get install git python3 python3-pip python3-dev python-pip-whl -y
RUN pip install --upgrade pip
RUN mkdir /images
WORKDIR /app
ADD /app /app
RUN pip3 install -r req3.txt
RUN ln -s /images /app/static/
EXPOSE 5000
ENTRYPOINT ["python3"]
CMD ["/app/wsgi.py"]
