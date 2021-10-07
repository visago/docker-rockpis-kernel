# Docker based cross compiler for Radxa's rock-pi-s kernel/modules

Quick and dirty docker image to build rock pi s kernel/modules for bt-usb

```
mkdir -p drivers/
docker build -t rockpis-cross . 
docker cp $(docker create --rm rockpis-cross):/tmp/kernel/drivers/bluetooth drivers/
```

You can then copy the modules to your rockpi. 
```
sudo cp *.ko /usr/lib/modules/4.4.143-55-rockchip-g6b7accbc999b/kernel/drivers/bluetooth
sudo depmod -a
```

* Check dmesg for hints on issues


## Manual changes
```
docker build -t rockpis .
docker run --it -v .:/mnt rockpis .
cd /tmp/kernel
make menuconfig
<do what you need to do>
<build everything you need>
```

## Updating..

The kernels will most prob be updated at radxa's rock-pi-s 

* [Module.symvers](./Module.symvers) is from /usr/src/linux-headers-4.4.143-55-rockchip-g6b7accbc999b/Module.symvers
* CONFIG_LOCALVERSION needs to match the version prefix on the running kernel
