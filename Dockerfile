# Use Ubuntu as the base image
FROM ubuntu:20.04

# We want to change this user if we intend to take it out of development. Root poses a security risk
USER root

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=non-interactive

# Update package lists
RUN apt-get update

# Install essential packages
RUN apt-get install -y wget build-essential autoconf automake libtool

# Install dependencies for Suricata
RUN apt-get install -y \
    libpcre3 libpcre3-dbg libpcre3-dev libpcre2-dev \
    libpcap-dev libnet1-dev \
    libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 \
    make libmagic-dev libjansson-dev libnss3-dev \
    libgeoip-dev liblua5.1-dev libhiredis-dev libevent-dev \
    python-yaml rustc cargo

# Download and compile Suricata
RUN wget https://www.openinfosecfoundation.org/download/suricata-7.0.1.tar.gz \
    && tar -xvzf suricata-7.0.1.tar.gz \
    && cd suricata-7.0.1 \
    && ./configure --enable-nfqueue --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    && make \
    && make install-full

# Expose the necessary port
EXPOSE 80

# Default command
CMD ["suricata", "-c", "/etc/suricata/suricata.yaml", "-i", "eth0"]

