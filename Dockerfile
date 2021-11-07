FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive 
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		libdatetime-perl \
		libwww-perl \
		perl \
		irssi \
		ncurses-base ncurses-bin ncurses-term; 

ENV HOME /home/sam

RUN set -eux; \
	useradd --create-home --home-dir "$HOME" sam; \
	mkdir "$HOME/.irssi"; 

ENV LANG C.UTF-8


WORKDIR /home/sam/
COPY irssi  /home/sam/.irssi
RUN chown -R sam:sam "$HOME"

USER sam
CMD ["irssi"]

