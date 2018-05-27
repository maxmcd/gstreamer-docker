FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends \
    autoconf `# libnice` \
    automake `# libnice` \
    bison \
    build-essential \
    ca-certificates \
    flex \
    gettext \
    git \
    gnutls-dev `# libnice` \
    gtk-doc-tools `# libnice` \
    libffi-dev \
    libglib2.0 \
    libnice-dev \
    libopus-dev \
    libpcre3-dev \
    libsrtp-dev \
    libssl-dev `# needed for DTLS requirement`\
    libtool `# libnice` \
    libvpx-dev \
    libx264-dev \
    mount \
    perl \
    python \
    wget \
    zlib1g \

# http://www.linuxfromscratch.org/blfs/view/svn/multimedia/gstreamer10.html
    && wget https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.14.0.tar.xz \
    && tar xvfJ gstreamer-1.14.0.tar.xz > /dev/null \
    && cd gstreamer-1.14.0 \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && cd / \
# gst-plugins-base
    && wget https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.0.tar.xz \
    && tar xvfJ gst-plugins-base-1.14.0.tar.xz > /dev/null \
    && cd gst-plugins-base-1.14.0 \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && cd / \
# libnice
    && git clone https://github.com/libnice/libnice.git \
    && cd libnice \
    && ./autogen.sh --prefix=/usr --with-gstreamer --enable-static --enable-static-plugins --enable-shared --without-gstreamer-0.10 --disable-gtk-doc \
    && make install \
    && cd / \
# gst-plugins-good
    && wget https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.0.tar.xz \
    && tar xvfJ gst-plugins-good-1.14.0.tar.xz > /dev/null \
    && cd gst-plugins-good-1.14.0 \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && cd / \
# gst-plugins-bad
    && wget https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.14.0.tar.xz \
    && tar xvfJ gst-plugins-bad-1.14.0.tar.xz > /dev/null \
    && cd gst-plugins-bad-1.14.0 \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && cd / \
# gst-plugins-ugly
    && wget https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.14.0.tar.xz \
    && tar xvfJ gst-plugins-ugly-1.14.0.tar.xz > /dev/null \
    && cd gst-plugins-ugly-1.14.0 \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && cd / \
# gst-rtsp-server
    && wget https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.14.0.tar.xz \
    && tar xvfJ gst-rtsp-server-1.14.0.tar.xz > /dev/null \
    && cd gst-rtsp-server-1.14.0 \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && cd / \
    rm -rf gst*
