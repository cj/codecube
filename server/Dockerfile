# Pull base image.
FROM ubuntu:14.04

# Install Ruby.
RUN echo "cache-bust"
RUN apt-get update
RUN apt-get install -y build-essential python ruby golang-go perl
RUN apt-get install -y ruby ruby-dev ruby-bundler

# Allow hosts to be updated
RUN cp /etc/hosts /tmp/hosts
RUN mkdir -p -- /lib-override && cp /lib/x86_64-linux-gnu/libnss_files.so.2 /lib-override
RUN perl -pi -e 's:/etc/hosts:/tmp/hosts:g' /lib-override/libnss_files.so.2
ENV LD_LIBRARY_PATH /lib-override

# Allow .NET code
RUN apt-get -y -q install wget
RUN wget -q http://download.opensuse.org/repositories/home:tpokorra:mono/xUbuntu_14.04/Release.key -O- | apt-key add -
RUN apt-get remove -y --auto-remove wget
RUN sh -c "echo 'deb http://download.opensuse.org/repositories/home:/tpokorra:/mono/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/mono-opt.list"
RUN apt-get -q update
RUN apt-get -y -q install mono-opt
RUN apt-get -y -q install mono-gmcs
RUN gem install roda

ADD entrypoint.sh entrypoint.sh
ADD run-code.sh run-code.sh

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
