FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install --no-install-recommends -y cmake \
    build-essential \
    git \
    apt-transport-https \
    ca-certificates \
    python3 \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    libstdc++-arm-none-eabi-newlib \
    && rm -rf /var/lib/apt/lists/*

# Pico SDK
ENV PICO_SDK_PATH=/opt/pico-sdk
ARG PICO_SDK_VERSION=master
RUN git clone --depth 1 --branch ${PICO_SDK_VERSION} \
    https://github.com/raspberrypi/pico-sdk.git \
    ${PICO_SDK_PATH} \
    && git -C ${PICO_SDK_PATH} submodule update --init

# Pico extra
ENV PICO_EXTRAS_PATH=/opt/pico-extras
ARG PICO_EXTRAS_VERSION=master
RUN git clone --depth 1 --branch ${PICO_EXTRAS_VERSION} \
    https://github.com/raspberrypi/pico-extras.git \
    ${PICO_EXTRAS_PATH} \
    && git -C ${PICO_EXTRAS_PATH} submodule update --init
