# Author: Haniye Kashgarani
# Affiliation: University of Wyoming
# ORCID: 0000-0001-6059-1920
# Date: 2023-07-24T7:22:34+00:00
# Github: haniyeka

FROM gcc:latest

ENV HOME=/root

RUN apt-get update

RUN apt-get -yq install build-essential \
    wget \
    bzip2 \
    tar \
    zlib1g-dev \
    m4 \
    file \
    openssh-server \
    libcurl4-openssl-dev \
    dpkg \
    python3

RUN echo "alias python=python3" >> ~/.bashrc && . ~/.bashrc

RUN wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.14/hdf5-1.14.0/src/hdf5-1.14.0.tar.bz2 \
    && tar xjvf hdf5-1.14.0.tar.bz2 \
    && cd hdf5-1.14.0 \
    && ./configure --enable-shared --with-default-api-version=v110 --prefix=/usr/local/hdf5 \
    && make \
    && make install \
    && cd .. \
    && rm -rf hdf5-1.14.0 hdf5-1.14.0.tar.bz2

RUN wget https://github.com/Unidata/netcdf-c/archive/refs/tags/v4.8.1.tar.gz \
    && tar -xzvf v4.8.1.tar.gz

RUN cd netcdf-c-4.8.1 \
    # && patch -p1 < largefiles.patch \
    && ./configure --prefix=/usr/local/netcdf LDFLAGS=-L/usr/local/hdf5/lib CFLAGS=-I/usr/local/hdf5/include \
    && make \
    && make install \
    && cd .. \
    && rm -rf netcdf-c-4.8.1 v4.8.1.tar.gz

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/local/netcdf/lib

RUN wget https://github.com/Unidata/netcdf-fortran/archive/refs/tags/v4.6.1.tar.gz \
    && tar -xzvf v4.6.1.tar.gz

RUN cd netcdf-fortran-4.6.1 \
    && ./configure --prefix=/usr/local/netcdf LDFLAGS="-L/usr/local/hdf5/lib -L/usr/local/netcdf/lib" CFLAGS="-I/usr/local/hdf5/include -I/usr/local/netcdf/include" \
    && make \
    && make install \
    && cd .. \
    && rm -rf netcdf-fortran-4.6.1 v4.6.1.tar.gz

ENV GFORTRAN_NETCDF_FORTRAN=/usr/local/netcdf/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/local/netcdf/lib
