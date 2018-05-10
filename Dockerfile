
FROM centos:7

LABEL maintainer="lovero1989@gmail.com"

RUN yum -y update && yum clean all
RUN yum -y install git golang gcc automake autoconf libtool make readline-devel && yum clean all


COPY LuaJIT-2.0.4.tar.gz /tmp
RUN cd /tmp && \
   tar xvzf LuaJIT-2.0.4.tar.gz && \
   cd LuaJIT-2.0.4 && \
   make && make install && \
   mkdir /usr/local/lib/luajit && \
   cp /usr/local/lib/libluajit-5.1.a /usr/local/lib/luajit/ && \
   export LUA_CPATH="./?.so;/usr/local/lib/lua/5.1/?.so"

COPY luajit-2.0.4-3.el7.x86_64.rpm /tmp
RUN cd /tmp && \
    rpm -ivh luajit-2.0.4-3.el7.x86_64.rpm

COPY luajit-2.0.4-3.el7.src.rpm /tmp
RUN cd /tmp && \
    rpm -ivh luajit-2.0.4-3.el7.src.rpm


COPY lua-cjson-2.1.0.tar.gz /tmp
RUN cd /tmp && \
    tar xvzf lua-cjson-2.1.0.tar.gz && \
    cd lua-cjson-2.1.0 && \
    make && make install


VOLUME /data/loris

WORKDIR /data/loris
