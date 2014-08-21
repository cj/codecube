# Pull base image.
FROM ubuntu:14.04

# Install Ruby.
RUN echo "cache-bust"
RUN apt-get update
RUN apt-get install -y build-essential python ruby golang-go perl
RUN apt-get install -y ruby ruby-dev ruby-bundler
RUN cp /etc/hosts /tmp/hosts
RUN mkdir -p -- /lib-override && cp /lib/x86_64-linux-gnu/libnss_files.so.2 /lib-override
RUN perl -pi -e 's:/etc/hosts:/tmp/hosts:g' /lib-override/libnss_files.so.2
ENV LD_LIBRARY_PATH /lib-override

ADD entrypoint.sh entrypoint.sh
ADD run-code.sh run-code.sh

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
