FROM ubuntu:22.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update && apt-get install -y apt-utils wget curl locales && rm -rf /var/lib/apt/lists/*
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  
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
