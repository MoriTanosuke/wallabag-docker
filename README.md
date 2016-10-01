wallabag-dockerfile
===================

[![](https://images.microbadger.com/badges/image/moritanosuke/wallabag-docker.svg)](https://microbadger.com/images/moritanosuke/wallabag-docker)

I created this Dockerfile because I had the [official image][1] crash 
on me a couple times and I had to restart my docker server because I
couldn't find a way to remove the zombie process created by the [s6 
supervisor][3].

This Dockerfile does not use any supervisor. It's based on [php:apache][2]
and has nothing else running.

[0]: https://www.wallabag.org
[1]: http://doc.wallabag.org/en/master/user/installation.html#installation-with-docker
[2]: https://hub.docker.com/_/php/
[3]: http://www.skarnet.org/software/s6/
