rm -rf .git/ # This avoids the issue where we get a + after the version below
sed -i 's/CONFIG_LOCALVERSION=""/CONFIG_LOCALVERSION="-55-rockchip-g6b7accbc999b"/'  .config # Has to match the running kernel !
echo "CONFIG_BT_INTEL=m" >> .config
echo "CONFIG_BT_BCM=m" >> .config
echo "CONFIG_BT_RTL=m" >> .config
echo "CONFIG_BT_RTKBTUSB=m" >> .config
echo "CONFIG_BT_HCIBTUSB=m" >> .config
echo "CONFIG_BT_HCIBTUSB_BCM=y" >> .config
echo "CONFIG_BT_HCIBTUSB_RTL=y" >> .config
echo "CONFIG_BT_HCIBTSDIO=m" >> .config
echo "CONFIG_BT_HCIBCM203X=m" >> .config
echo "# CONFIG_BT_ATH3K is not set" >> .config

