<h1>Upgraded Server Side Picture Frame Web App </h1>

This is a fork/rework of <https://github.com/satssehgal/pictureframe>.

I couldn't get the original to run on my primary (Intel based) home server, and wasn't happy with how it ran on my arm based sbc.  I wanted a simple, easy to redeploy soluiton that would grab pictures from a folder on my local NAS, which the original didn't really easily allow for. 

<h3>My version implements a few big changes</h3>
-Volume support - allows you to more easily edit the html/css and python files, as well as direct the app to a folder on your NAS storage.
-Auto-resizing pictures (prioritized for portrait mode).
-Vertically centered images, with black background above and below landscape photos
-Deploys more easily

This is a straightforward server side picture frame web application that you can use to host photos and display on a screen. (I've got mine running on an old gen 1 ipad, and it works well in both Safari and Dolphin). 

<h3>Usage</h3>

There are three tag options, latest, portrait, and landscape.  Both :latest and :portrait are optimized for portrait images (black bars are placed on above and below scaled down landscape images).  The :landscape tag is optimized for landscape images, and black bars will appear on either side of your images.  Use whichever images best suits your needs.

You'll need to bind mount a folder to /images (I use a folder on my local NAS), and ideally you should create and specify a named volume for /app. 

Move any image you want into the folder mapped to /images and watch it come to life on all your devices. No more SD cards or external storage needed for each device. 


Edit the docker-compose.yaml file so that your bind paths to app and images are correct

````
version: '3.3'
services:
  picframe: 
    image: demuthrc/pframe2:latest 
    ports: 
      - "5000:5000" ythe 
    volumes:
     - /path/to/pictures:/images
     - /path/to/app:/app
    restart: always
````

Then execute

````
docker-compose up -d
````
You should also be able to get this up and running on portainer, or with a docker build command using the image rcdemuth/pframe2 over on github.

You should be good to go.  Please note, that if you do a bind mount to /app, then you will need to manually copy all of the /app files into the mounted directory on your host machine.
