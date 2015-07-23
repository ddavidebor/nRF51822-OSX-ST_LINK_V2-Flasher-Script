#!/bin/bash
hex_firmware=$(ls -dt *.hex | head -1)
softdevice_firmware=$(echo softdevice.hex)

echo "hex firmware is $hex_firmware"
echo "softdevice firmware is $softdevice_firmware"

openocd -f interface/stlink-v2.cfg -f target/nrf51.cfg -c "init ; halt; sleep 500 ; nrf51 mass_erase ; sleep 500 ; program $softdevice_firmware verify ; sleep 500 ; program $hex_firmware verify ; sleep 500 ; resume"

echo "flashing complete"
echo "hex firmware was $hex_firmware"
echo "softdevice firmware was $softdevice_firmware"