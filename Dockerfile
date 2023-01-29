FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    apt-utils 
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda init && conda config --set always_yes yes --set changeps1 no
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda init && conda config --set always_yes yes --set changeps1 no
RUN conda --version
RUN pip install nvidia-pyindex
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 agsuser
