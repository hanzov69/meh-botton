<p align="center">
    <a href="https://cloud.docker.com/repository/docker/hanzov69/meh-botton/builds" alt="Build Status">
        <img src="https://img.shields.io/docker/cloud/build/hanzov69/meh-botton.svg?style=popout" /></a>
    <a href="https://cloud.docker.com/repository/docker/hanzov69/meh-botton/general" alt="Pulls">
            <img src="https://img.shields.io/docker/pulls/hanzov69/meh-botton.svg?style=popout" /></a>
</p>

Every day we click the leetle button. It is so easy, yet we forget sometimes.
This toy stands on the ~~neck~~ shoulders of [Shawn Miller's](https://github.com/freshlogic) [work](https://meh.com/forum/topics/i-hacked-the-amazon-dash-button-to-click-meh-at-meh-com-instead-of-ordering-tide), but makes it dumber and way more complex. Because if we make it too easy to cheat then it's, um, cheating.

## About
This takes a dumbed down version of the nightmare script, wraps it up in a container, runs it every two hours* via _cron_, and clicks the button.
To make it more interesting, I've done the leg work to make this also run ~~nicely~~ on an ARM platform- think BeagleBone Black (and probably RPi or similar).

And I'm building the images for you, because I care.

## If you know what you're doing...
Credentials are handled via environment variables, MEHUSERNAME and MEHPASSWORD.
`docker pull hanzov69/meh-botton:latest`
`docker pull hanzov69/meh-botton:arm32v7-latest`

## If you don't know what you're doing...in docker
### Using the docker hub image
1. Grab a copy of _meh-botton-docker.sh_
   curl -O https://github.com/hanzov69/meh-botton/blob/master/meh-botton-docker.sh
2. Edit this file, change the values for MEHUSERNAME and MEHPASSWORD to your own.
3. _sh ./meh-botton-docker.sh_
4. To see what's happening, try _docker exec -it meh-botton tail -f /var/log/cron.log_

### Building it your own dang self
1. `git clone  https://github.com/hanzov69/meh-botton.git`
2. `docker build -t meh-botton .`
3.
```
    docker run -d -t -i -e\
      MEHUSERNAME="your username"\
      -e MEHPASSWORD="your password"\
      -e TASK_SCHEDULE='0 */2 * * * '\
      --name meh-botton\
      meh-botton
```
## If you know what you're doing...in kubernetes
1. `curl -O https://github.com/hanzov69/meh-botton/blob/master/meh-botton-deployment.yaml`
   Make sure to edit this file with your credentials.
   **NOTE: This is not being handled with kubectl secrets. It probably should be, but you know what you're doing, right?**
1a. **ARM** `curl -O https://github.com/hanzov69/meh-botton/blob/master/meh-botton-deployment-arm32v7.yaml`
2. `kubectl apply -f meh-botton-deployment.yaml`
2a. `kubectl apply -f meh-botton-deployment-arm32v7.yaml`

## About the schedule...
By default this will run every two hours, on the hour. Which means it may not run for a couple of hours when you first fire it up. That's cool.
With this in mind, it should hit the site 12 times a day, which seems like *more* than enough.

I **really** don't recommend messing with this value, particularly to something more aggressive unless you know what you're doing and are willing to risk the wrath of mediocrebot.
