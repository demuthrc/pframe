Fork of satssehgal/pictureframe
Server Side Picture Frame Web App
This is a very simple server side picture frame web application that you could use to host photos and display them on a computer, phone, or even hang a tablet on a wall and build a rotating image picture frame.

You'll need to mount and bind the folder you want to use for your pictures, as well as a folder/volume to use for the files.

 Move any image you want into the img folder and watch it come to life on all your devices. No more SD cards or external storage needed for each device. See below for the simple docker-compose file

Download the files and run 'docker-compose up -d' and you're set. It will launch on your device at port 5000. Its a good idea to have a static ip for your host machine

Tested on raspberry pi zero, 3, 3B+, 4B, RockPi64, and Mac Big Sur. If the images fails to load on your OS i've included the core files and Dockerfile for your to build your own image.

*note, I cannot get it to work on normal windows

docker-compose.yaml

````
version: '3.3'
services:
  picframe: 
    image: demuthrc/pframe:latest 
    ports: 
      - "5000:5000" 
    volumes:
     - /path/to/pictures:/images
     - /path/to/app:/app
    restart: always
    
  ````
