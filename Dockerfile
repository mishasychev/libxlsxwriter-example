FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    wget \
    software-properties-common \
    gnupg \
    lsb-release \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
    && echo "deb http://apt.llvm.org/noble/ llvm-toolchain-noble-18 main" >> /etc/apt/sources.list.d/llvm.list

RUN apt update && apt install -y \
    clang-18 \
    lldb-18 \
    lld-18 \
    clangd-18 \
    libc6-dev \
    build-essential \
    cmake \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-18 100 \
    && update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-18 100

WORKDIR /workspace
