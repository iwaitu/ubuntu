FROM ubuntu:22.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update && apt-get install -y apt-utils wget curl locales vim && rm -rf /var/lib/apt/lists/*
ENV LANG=en_US.UTF-8
RUN sed -i -e "s/# $LANG.*/$LANG UTF-8/" /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=$LANG

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh
RUN conda init && conda config --set always_yes yes --set changeps1 no
RUN conda --version
RUN pip install nvidia-pyindex

RUN addgroup agsuser
RUN useradd -rm -d /home/agsuser -s /bin/bash -g agsuser -G root agsuser
RUN echo 'agsuser:agsuser888' | chpasswd
RUN chown -R agsuser:agsuser /root

