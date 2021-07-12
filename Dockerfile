FROM python:3.7.3-slim-stretch

RUN apt-get update -y
RUN apt-get install  python3 python3-pip python3-dev python-pip-whl -y
RUN pip install --upgrade pip
ADD https://github.com/demuthrc/pframe.git /
RUN ln -sf /images /app/static/images
WORKDIR /app
RUN pip3 install -r app/req3.txt
EXPOSE 5050
ENTRYPOINT ["python3"]
CMD ["/app/wsgi.py"]
