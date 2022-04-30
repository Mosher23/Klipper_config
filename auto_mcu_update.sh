#!/bin/sh
sudo systemctl stop klipper
cd ~/klipper

make clean KCONFIG_CONFIG=config.octopus
make KCONFIG_CONFIG=config.octopus
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f446xx_2D0026000F5053424E363620-if00 KCONFIG_CONFIG=config.octopus


make clean KCONFIG_CONFIG=config.rpi
make KCONFIG_CONFIG=config.rpi
make flash KCONFIG_CONFIG=config.rpi

sudo systemctl start klipper
