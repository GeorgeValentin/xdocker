FROM centos:7

LABEL maintainer="lovero1989@gmail.com"

RUN yum -y update && yum clean all
RUN yum -y install git golang gcc automake autoconf libtool make && yum clean all


#ARG version=1.6.3
#ARG version_name=1_6_3

#ENV GOBASE=/project/LOAM2/Backend/game/base

#RUN mkdir -p /data/server/${version} && chmod -R 777 /data
   
#VOLUME /data/server/${version} /project

COPY LuaJIT-2.0.4.tar.gz /tmp
COPY lua-cjson-2.1.0.tar.gz /tmp
RUN cd /tmp && \
    tar xvzf LuaJIT-2.0.4.tar.gz && \
    cd LuaJIT-2.0.4 && \
    make && make install && \
    mkdir /usr/local/lib/luajit && \
    cp /usr/local/lib/libluajit-5.1.a /usr/local/lib/luajit/ && \
    export LUA_CPATH="./?.so;/usr/local/lib/lua/5.1/?.so"

RUN cd /tmp && \
    tar xvzf lua-cjson-2.1.0.tar.gz && \
    cd lua-cjson-2.1.0 && \
    make && make install

VOLUME /data/loris

#ENV GOPATH /go

#WORKDIR /project/LOAM2/Code/en/branches/1.6.3/server
#WORKDIR /project/LOAM2/Code/en/branches/${version}/server
WORKDIR /data/loris

#ENTRYPOINT ./bin/server -N0101 -I192.168.33.10:16200 -L7 -V`pwd`