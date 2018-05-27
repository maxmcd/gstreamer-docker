FROM python:2.7.14
# cerbero needs python 2.7.*

RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    git \
    software-properties-common \
    python-software-properties \
    yasm \
    python-setuptools \
    sudo 
# create the ubuntu user
RUN addgroup --system ubuntu \
    && adduser --system --shell /bin/bash --gecos 'ubuntu' \
       --uid 1000 --disabled-password --home /home/ubuntu ubuntu \
    && adduser ubuntu sudo \
    && echo ubuntu:ubuntu | chpasswd \
    && echo "ubuntu ALL=NOPASSWD:ALL" >> /etc/sudoers

USER ubuntu
ENV HOME /home/ubuntu
RUN mkdir -p /home/ubuntu/cerbero/
WORKDIR /home/ubuntu/cerbero/

# Git config is needed so that cerbero can cleanly fetch some git repos
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"

# # build gstreamer 1.0 from cerbero source
# # the build commands are split so that docker can resume in case of errors
RUN git clone --depth 1 git://anongit.freedesktop.org/gstreamer/cerbero .
# hack: to pass "-y" argument to apt-get install launched by "cerbero bootstrap"
RUN sed -i 's/apt-get install/apt-get install -y/g' ./cerbero/bootstrap/linux.py
RUN ./cerbero-uninstalled bootstrap \
    && ./cerbero-uninstalled build glib \
    bison \
    gstreamer-1.0 \
    gst-plugins-base-1.0 \
    gst-plugins-good-1.0  \
    gst-plugins-bad-1.0 \
    gst-plugins-ugly-1.0 \
    gst-libav-1.0 \
    json-glib \
    && rm -rf ./build/sources/*

CMD ./cerbero-uninstalled shell