FROM haskell:8.2.2
MAINTAINER Leonti Bielski <prishelec@gmail.com>

VOLUME /src
WORKDIR /src

#RUN ["apk", "add", "--update-cache", "alpine-sdk", "zlib-dev", "xz"]

RUN ["stack", "upgrade"]

RUN apt-get update && apt-get install -y xz-utils make

COPY ["build-binary.sh", "/usr/local/sbin/"]

ENTRYPOINT ["/usr/local/sbin/build-binary.sh"]
