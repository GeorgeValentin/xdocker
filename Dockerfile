
FROM centos:7

LABEL maintainer="lovero1989@gmail.com"

RUN yum -y update && yum clean all
RUN yum -y install gcc automake autoconf libtool make readline-devel && yum clean all


COPY LuaJIT-2.0.4.tar.gz /tmp
COPY luajit-2.0.4-3.el7.x86_64.rpm /tmp
COPY lua-cjson-2.1.0.tar.gz /tmp

RUN cd /tmp && tar xvzf LuaJIT-2.0.4.tar.gz && cd LuaJIT-2.0.4 && make && make install && \
   cd /tmp && rpm -ivh luajit-2.0.4-3.el7.x86_64.rpm && \
   cd /tmp && tar xvzf lua-cjson-2.1.0.tar.gz && cd lua-cjson-2.1.0 && make && make install && \
   cd /tmp && rm -f LuaJIT-2.0.4.tar.gz && rm -f luajit-2.0.4-3.el7.x86_64.rpm && rm -f lua-cjson-2.1.0.tar.gz && rm -rf LuaJIT-2.0.4 && rm -rf lua-cjson-2.1.0


VOLUME /data/loris

WORKDIR /data/loris
