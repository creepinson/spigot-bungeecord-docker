# BungeeCord

* * *

## About this image

This Docker image allows you to run a BungeeCord instance quickly, with minimal fuss.

This image was based on the `dlord/bungeecord` Docker Image, and is maintained by Creepinson.

[Minecraft EULA]: https://account.mojang.com/documents/minecraft_eula

## Base Docker image

* java:8

## How to use this image

### Starting an instance

    docker run \
        --name spigot-instance \
        -p 0.0.0.0:25565:25577 \
        -d \
        -it \
        dlord/bungeecord

### Environment Variables

The image uses environment variables to configure the JVM settings.

#### BUNGEECORD_OPTS

You may adjust the JVM settings via the `BUNGEECORD_OPTS` variable.

## Extending this image

This image is meant to be extended for packaging custom maps, plugins, and
configurations as Docker images. For server owners, this is the best way to
roll out configuration changes and updates to your servers.

If you wish to do so, here are some of the things you will need to know:

### ONBUILD Trigger

This Docker image contains one `ONBUILD` trigger, which copies any local files
to `/usr/src/bungeecord`.

When a container is started for the first time, the contents of this folder is
copied to `BUNGEECORD_HOME` via `rsync`, except for anything that starts with
`world`. It will also ensure that the `BUNGEECORD_HOME/plugins` folder exists,
and it will clean out any plugin jar files to make way for new ones. This is
the simplest way to roll out updates without going inside the data volume.

### JVM Arguments

You can include them via the `BUNGEECORD_OPTS` variable in your Dockerfile.

## Supported Docker versions

This image has been tested on Docker version 1.9

## Feedback and Contributions

Feel free to open a [Github issue](https://github.com/creepinson/spigot-bungeecord-docker/issues).

If you wish to contribute, you may open a pull request.

## Todo

* Add PLUGINS option to automatically download plugins to the server folder

* Add links to helpful pages such as how to use docker

* Add more documentation such as docker volume configuration

* Add examples for docker-compose
