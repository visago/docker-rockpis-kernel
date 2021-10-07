###
### From https://wiki.radxa.com/RockpiS/dev/kernel-4.4
###
FROM debian:stretch
WORKDIR /tmp/kernel
ENV ARCH=arm64
ENV CROSS_COMPILE=/usr/local/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
RUN apt -y update && apt -y install joe make gcc wget curl xz-utils bash build-essential python bc ncurses-dev git kmod
RUN wget -c https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/aarch64-linux-gnu/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu.tar.xz -O - | xz -d - | tar -x -C /usr/local/
RUN cd /tmp && git clone -b stable-4.4-rockpis https://github.com/radxa/kernel.git 
COPY Module.symvers /tmp/kernel
RUN cd /tmp/kernel && make rk3308_linux_defconfig
RUN sed -i 's/CONFIG_LOCALVERSION=""/CONFIG_LOCALVERSION="-55-rockchip-g6b7accbc999b"/' /tmp/kernel/.config
COPY patch.sh /tmp/kernel
RUN cd /tmp/kernel && ./patch.sh
RUN make oldconfig scripts prepare modules_prepare
RUN make -j 4 -C . M=drivers/bluetooth
