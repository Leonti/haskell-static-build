FROM mitchty/alpine-ghc:8.0.2
MAINTAINER Leonti Bielski <prishelec@gmail.com>

WORKDIR /usr/lib/gcc/x86_64-alpine-linux-musl/6.2.1/
RUN cp crtbeginT.o crtbeginT.o.orig
RUN cp crtbeginS.o crtbeginT.o

VOLUME /src
WORKDIR /src

RUN ["apk", "add", "--update-cache", "alpine-sdk", "zlib-dev", "xz"]

COPY ["build-binary.sh", "/usr/local/sbin/"]

ENTRYPOINT ["/usr/local/sbin/build-binary.sh"]
