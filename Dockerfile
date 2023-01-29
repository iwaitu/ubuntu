FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    apt-utils wget
RUN apt-get update
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh \
    && echo PATH="/root/miniconda3/bin":$PATH >> .bashrc \
    && exec bash \
    && conda --version
RUN conda --version
RUN pip install nvidia-pyindex

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 agsuser
