#!/bin/sh
sudo systemctl stop klipper
cd ~/klipper

make clean KCONFIG_CONFIG=config.octopus
make KCONFIG_CONFIG=config.octopus
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f446xx_2D0026000F5053424E363620-if00 KCONFIG_CONFIG=config.octopus


make clean KCONFIG_CONFIG=config.rpi
make KCONFIG_CONFIG=config.rpi
make flash KCONFIG_CONFIG=config.rpi

make clean KCONFIG_CONFIG=config.toolhead
make KCONFIG_CONFIG=config.toolhead
python3 lib/canboot/flash_can.py -i can0 -f ./out/klipper.bin -u beb382378295

sudo systemctl start klipper
