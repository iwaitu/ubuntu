FROM ubuntu:22.04

ENV PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update && apt-get install -y apt-utils wget && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh
RUN conda --version
RUN pip install nvidia-pyindex

RUN addgroup agsuser
RUN useradd -rm -d /home/agsuser -s /bin/bash -g agsuser -G sudo agsuser
