FROM python:3.7.3-slim-stretch
VOLUME /app 
VOLUME /images
RUN apt-get update -y
RUN apt-get install git python3 python3-pip python3-dev python-pip-whl -y
RUN pip install --upgrade pip
#ADD /app ./app
#WORKDIR /
#RUN git clone https://github.com/demuthrc/pframe.git
#WORKDIR /pframe/app
#COPY /files/pframe/app /app
#COPY /files/images /images
#RUN ln -sf /images /app/static/images
WORKDIR /app
ADD /app /app
RUN pip3 install -r req3.txt
EXPOSE 5050
ENTRYPOINT ["python3"]
CMD ["wsgi.py"]
