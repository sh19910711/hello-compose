FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
  python \
  supervisor

RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections && \
  echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections && \
  apt-get -y install mysql-server

ADD app /workspace/src/app
WORKDIR /workspace/src/app
ENV GOPATH=/workspace
RUN apt-get install -y golang git
RUN go get .
RUN go build

ADD webapp.conf /etc/supervisor/conf.d/

EXPOSE 8080
ENTRYPOINT ["/sbin/init"]
