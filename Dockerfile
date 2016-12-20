FROM mitchty/alpine-ghc:latest
MAINTAINER Leonti Bielski <prishelec@gmail.com>

VOLUME /src
WORKDIR /src

RUN ["apk", "add", "--update-cache", "alpine-sdk"]

COPY ["build.sh", "/usr/local/sbin/"]

ENTRYPOINT ["/usr/local/sbin/build.sh"]
