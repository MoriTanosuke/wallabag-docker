wallabag-dockerfile
===================

[![](https://images.microbadger.com/badges/image/moritanosuke/wallabag-docker.svg)](https://microbadger.com/images/moritanosuke/wallabag-docker)

I created this Dockerfile because I had the [official image][1] crash 
on me a couple times and I had to restart my docker server because I
couldn't find a way to remove the zombie process created by the [s6 
supervisor][3].

This Dockerfile does not use any supervisor. It's based on [php:apache][2]
and has nothing else running. It's quite a bit larger than the official 
image, but I'm happy to pay this price if it runs stable and does not
bring down all my containers on a host.

How to use this
---------------

I added an example configuration for [docker-compose][4] in file *docker-compose.yml* to the repository to show how I use the Dockerfile. You can start the container with the following command:

    docker-compose up

After that open http://localhost:8111/ and you should see the login. Default login/password is *wallabag/wallabag*. Unfortunately the first login fails and you'll end up on an error page. If you open http://localhost:8111 again you should see the default articles in your running wallabag instance though.

[0]: https://www.wallabag.org
[1]: http://doc.wallabag.org/en/master/user/installation.html#installation-with-docker
[2]: https://hub.docker.com/_/php/
[3]: http://www.skarnet.org/software/s6/
[4]: https://www.docker.com/products/docker-compose
