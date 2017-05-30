#FROM debian:latest
FROM ubuntu:xenial
MAINTAINER  Pawky  version 1.0
#ENV DEBIAN_FRONTEND noninteractive
RUN  apt-get update \
  && apt-get install -y locales 			\
  && apt-get install -y sudo	 			\
  && apt-get install -y apt-utils 			\
  && apt-get install -y unzip 				\ 
  && apt-get install -y vim 				\ 
  && apt-get build-dep -y mixxx 			\
  && apt-get install -y g++ 				\ 
  && apt-get install -y	git 				\ 
  && apt-get install -y	scons 				\ 
  && apt-get install -y libqt4-dev 			\ 
  && apt-get install -y libqt4-sql-sqlite 	\
  && apt-get install -y libportmidi-dev 	\
  && apt-get install -y libopusfile-dev 	\ 
  && apt-get install -y libshout-dev 		\
  && apt-get install -y libtag1-dev 		\ 
  && apt-get install -y libprotobuf-dev 	\
  && apt-get install -y protobuf-compiler 	\
  && apt-get install -y libusb-1.0-0-dev 	\
  && apt-get install -y libfftw3-dev 		\
  && apt-get install -y libmad0-dev 		\ 
  && apt-get install -y portaudio19-dev 	\
  && apt-get install -y libchromaprint-dev 	\
  && apt-get install -y	librubberband-dev 	\ 
  && apt-get install -y libsqlite3-dev 		\
  && apt-get install -y	libid3tag0-dev 		\
  && apt-get install -y libflac-dev 		\ 
  && apt-get install -y libsndfile-dev 		\ 
  && apt-get install -y libupower-glib-dev 	\
  && apt-get install -y libjack-dev 		\
  && apt-get install -y	libjack0 			\
  && apt-get install -y	portaudio19-dev 	\
  && apt-get install -y libfaad-dev 		\
  && apt-get install -y	libmp4v2-dev  		\
  && apt-get clean 							\ 
  && rm -rf /var/lib/apt/lists/* 

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# Definable users at build time   ( --build-args USR=<some name> ))
ARG USR
ARG PASSWD

#Env variable USER will either be current host user or mixxxer
ENV USER ${USR:-mixxxer}

RUN useradd --uid 1000 --create-home -g 100 -d /home/$USER $USER
RUN usermod -a -G sudo $USER
USER $USER
ENV HOME /home/$USER
WORKDIR /home/$USER
