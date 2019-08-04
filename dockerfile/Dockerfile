FROM sameersbn/bind:9.11.3-20190113

MAINTAINER Pablo Valentini <p.valentini@alumnos.edu.ar>

# For text editors
ENV TERM xterm

# Set time zone
ENV TZ=America/Argentina/Buenos_Aires
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV DEBIAN_FRONTEND noninteractive

# Update repositories cache
RUN apt-get update

RUN apt-get install -y --no-install-recommends apt-utils

RUN apt-get -y -f install \
	apache2 \
	php \
	postfix \
	mysql-server \
	spamassassin \
	proftpd-basic \
	curl \
	git

ENV DEBIAN_FRONTEND teletype

# Set current working directory.
WORKDIR /

EXPOSE 25 53 80 10000
