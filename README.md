#flasher script for nordic nRF51822 Bluetooth Low energy ic

##What it does
This script allow any people developing with the nRF51822 to easly flash the IC with custom firmware, using the ST-LINK V2 programmer available for less than 2$ on aliexpress and less than 8$ worldwide.

The script automatically pick up the last .hex file added in the folder, so if you're developing with mbed (an online ide, that download automatically the .hex file after compiling) you can flash the chip istantaneusly.

Generally, you will want to use the firmware from your download folder.



##Requirements

This script work only on OSX or Linux computers.
you need to have openocd installed and a ST-LINK V2 clone programmer.

##Install openocd

To install openocd on Mac OSX first install homebrew, a lightweight package manager that don't mess with your sistem.

```Shell

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


```

then just run

```Shell

brew install open-ocd

```

On ubuntu, you should be able to run 

```Shell

sudo apt-get install openocd

```

##Use the script

To use the script:

Place the script in the download folder of your browser. If you are on linux you may need to make it executable by running

```Shell

cd /path/to/your/download/folder
chmod +x flasher.sh

```

Then, download the softdevice (the bluetooth stack) for the nRF51822 on this page: https://www.nordicsemi.com/eng/Products/Bluetooth-Smart-Bluetooth-low-energy/nRF51822 
The S110 7.x version is suggested if you're developing with mbed.

Place the .hex file in the ZIP your just downloaded in the download folder (together with the script) and rename it "softdevice.hex"

After compiling on the mbed online ide, just run:

```Shell

cd /path/to/your/download/folder
./flasher.sh

```

Openocd will remain open to allow the chip to run, otherwise it will stay idle. To exit from openocd, just close the terminal windows to kill the process and re-run the script to reflash the chip.




