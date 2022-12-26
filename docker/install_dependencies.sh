#!/bin/bash

# Envrionment variables
R_VERSION_MAJOR=$1
R_VERSION_MINOR=$2
R_VERSION_PATCH=$3
QUARTO_VERSION=$4
CONFIGURE_OPTIONS=$5
# Install dependencies
apt-get update && apt-get install -y --no-install-recommends \
apt-utils\
    gfortran \
    git \
    g++ \
    libreadline-dev \
    libx11-dev \
    libxt-dev \
    libpng-dev \
    libjpeg-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libudunits2-dev \
    libgdal-dev \
    libbz2-dev \
    libzstd-dev \
    liblzma-dev \
    libpcre2-dev \
    locales \
    openjdk-8-jdk \
    screen \
    texinfo \
    texlive \
    texlive-fonts-extra \
    wget \
    xvfb \
    tzdata \
    jq\
    zlib1g \
    g++-11 \
    libz-dev \
    freetype2-demos \
    libtiff-dev \
    make \
    fontconfig \
    libfribidi-dev \
    libharfbuzz-dev \
    libfontconfig1-dev \
    vim \
    curl \
    nodejs \
    npm \
    sudo \
    texlive-latex-extra \
    build-essential \
    gfortran \
    libbz2-dev \
    texlive-xetex \
    lmodern \
    && rm -rf /var/lib/apt/lists/*

# Installing R
wget https://cran.rstudio.com/src/base/R-${R_VERSION_MAJOR}/R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz && \
    tar zxvf R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz && \
    rm R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz

cd /R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}

./configure ${CONFIGURE_OPTIONS} && \
    make && \
    make install

# Installing Quarto
TEMP_QUARTO="$(mktemp)" &&
wget -O "$TEMP_QUARTO" https://github.com/quarto-dev/quarto-cli/releases/download/v$QUARTO_VERSION/quarto-${QUARTO_VERSION}-linux-amd64.deb &&
sudo dpkg -i "$TEMP_QUARTO"
rm -f "$TEMP_QUARTO"




# Install miniconda
sudo apt update && apt-get install -y --no-install-recommends \
    software-properties-common \
    && sudo add-apt-repository -y ppa:deadsnakes/ppa \
    && sudo apt update 

wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && /bin/bash ~/miniconda.sh -b -p /opt/conda \
    && export PATH=/opt/conda/bin:$PATH \
    && conda init bash \
    && conda install conda-build

# Set environment
. /root/.bashrc \
    && conda create -y --name $CONDA_ENV python=$PYTHON_VER 

echo "conda activate $CONDA_ENV" >> ~/.bashrc
