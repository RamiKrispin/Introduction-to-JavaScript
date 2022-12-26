FROM ubuntu:22.04

# Setting environment variables
ARG CONDA_ENV=atsaf
ENV CONDA_ENV=$CONDA_ENV

ARG PYTHON_VER=3.10
ENV PYTHON_VER=$PYTHON_VER

ARG QUARTO_VERSION=1.2.269
ENV QUARTO_VERSION=$QUARTO_VERSION
# R settings
ENV R_VERSION_MAJOR=4
ENV R_VERSION_MINOR=2
ENV R_VERSION_PATCH=2
ENV CONFIGURE_OPTIONS="--with-readline=no --with-x=no --with-cairo --with-jpeglib --enable-R-shlib --with-blas --with-lapack"
ENV RENV_VERSION 0.9.3

ENV LANG="en_US.UTF-8"
ENV LC_COLLATE="en_US.UTF-8"
ENV LC_CTYPE="en_US.UTF-8"
ENV LC_MESSAGES="en_US.UTF-8"
ENV LC_MONETARY="en_US.UTF-8"
ENV LC_NUMERIC="en_US.UTF-8"
ENV LC_TIME="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
# Installing dependencies
RUN mkdir packages
COPY install_dependencies.sh packages/
RUN bash packages/install_dependencies.sh $R_VERSION_MAJOR $R_VERSION_MINOR $R_VERSION_PATCH $QUARTO_VERSION $CONFIGURE_OPTIONS