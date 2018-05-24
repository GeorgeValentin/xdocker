FROM centos:7

LABEL maintainer="lovero1989@gmail.com"

COPY vendor /tmp/vendor

RUN \
   echo "hello world!" && \
   #yum -y update && yum clean all && \
   yum -y install gcc automake autoconf libtool make && yum clean all && \
   cd /tmp/vendor && tar xvzf LuaJIT-2.0.4.tar.gz && cd LuaJIT-2.0.4 && make && make install && \
   cd /tmp/vendor && rpm -ivh luajit-2.0.4-3.el7.x86_64.rpm && \
   cd /tmp/vendor && tar xvzf lua-cjson-2.1.0.tar.gz && cd lua-cjson-2.1.0 && make && make install && \
   yum -y remove gcc automake autoconf libtool make && yum clean all && \
   rm -rf /var/cache/yum && rm -rf /tmp/vendor

VOLUME /data/loris

WORKDIR /data/loris