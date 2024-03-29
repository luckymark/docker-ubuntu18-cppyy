FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
  apt-get update -y && \
  apt-get -y install \
  build-essential \
  gfortran \
  autoconf \
  cmake \
  clang \
  ninja-build \
  libblas-dev \
  liblapack-dev \
  libgmp-dev \
  libgsl-dev \
  libpng-dev \
  git \
  libfftw3-dev \
  libhdf5-dev \
  hdf5-tools \
  libpython3-dev \
  python3-pip \
  libtool \
  software-properties-common \
  mpich \
  curl \
  pkg-config

RUN pip3 install numpy scipy matplotlib h5py pytest cppyy

ENV CC="/usr/bin/clang" \
    CXX="/usr/bin/clang++"

RUN mkdir ~/install && \
    cd ~/install && \
    git clone http://github.com/HomerReid/libGDSII.git && \
    cd libGDSII/ && \
    chmod 777 autogen.sh && \
    sh autogen.sh && \
    make && \
    make install

