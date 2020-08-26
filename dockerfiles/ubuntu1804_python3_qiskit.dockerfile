FROM ubuntu:18.04

# Install the python development environment
ARG USE_PYTHON_3=True
ARG _PY_SUFFIX=${USE_PYTHON_3:+3}
ARG PYTHON=python${_PY_SUFFIX}
ARG PIP=pip${_PY_SUFFIX}

# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    ${PYTHON}-dev \
    ${PYTHON}-pip \
    git

RUN ${PIP} install --no-cache-dir --upgrade \
    pip \
    setuptools

RUN ln -s -f $(which ${PYTHON}) /usr/local/bin/python
RUN ${PYTHON} --version

# Installing basic dependencies
RUN apt update && apt install -y \
    build-essential \
    curl \
    openjdk-8-jdk \
    pkg-config \
    swig \
    unzip \
    wget \
    g++ \
    zlib1g-dev \
    zip

RUN cd /tmp
RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh
RUN bash Anaconda3-2020.02-Linux-x86_64.sh -b -p /opt/conda
RUN apt install nano
RUN ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
ENV HOME /home
# CMD [ "/opt/conda/etc/profile.d/conda.sh", "/etc/profile.d/conda.sh" ]
# ENTRYPOINT [ "ln", "-s", "/opt/conda/etc/profile.d/conda.sh", "/etc/profile.d/conda.sh" ]
RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
# ENTRYPOINT [ "echo", ". /opt/conda/etc/profile.d/conda.sh", ">>", " ~/.bashrc" ]
RUN echo "conda activate base" >> ~/.bashrc
# ENTRYPOINT [ ". /opt/conda/etc/profile.d/conda.sh" ]
# ENTRYPOINT [ ". /opt/conda/etc/profile.d/conda.sh" ]
# WORKDIR /home
# ENTRYPOINT [ "bash", "-c", "conda activate base"]
RUN . /opt/conda/etc/profile.d/conda.sh
ENV PATH /opt/conda/bin:$PATH
# ENTRYPOINT [ "/bin/bash", "-c", "conda activate base" ]
# RUN pip install -U pip && pip install qiskit
# ENTRYPOINT [ "pip", "install", "qiskit" ]
# SHELL [ "conda", "activate", "base" ]
SHELL ["conda", "run", "-n", "base", "/bin/bash", "-c"]
# ENTRYPOINT [ "/bin/bash" ]
# RUN conda activate base
# CMD ["conda", "activate", "base"]
# CMD ["pip", "install", "qiskit"]
# SHELL ["python", "-m", "pip", "install", "qiskit"]
RUN echo $PATH
RUN pip install qiskit
# RUN python -m pip install qiskit
# ENTRYPOINT [ "conda", "activate", "base" ]
ENTRYPOINT [ "python" ]