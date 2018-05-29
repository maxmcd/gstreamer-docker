FROM alpine:edge

RUN apk add --no-cache \
    autoconf `# libnice`\
    automake `# libnice`\
    bison \
    build-base \
    flex \
    gettext-dev \
    git \
    glib \
    gnutls-dev `# libnice`\
    gtk-doc `# libnice`\
    libffi-dev \
    libmount \
    libsrtp-dev \
    libtool `# libnice`\
    libvpx-dev \
    linux-headers \
    openssl-dev `# needed for DTLS requirement`\
    opus-dev \
    pcre-dev \
    perl \
    python \
    x264-dev \
    zlib-dev

# http://www.linuxfromscratch.org/blfs/view/svn/multimedia/gstreamer10.html
RUN wget https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.14.0.tar.xz \
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
