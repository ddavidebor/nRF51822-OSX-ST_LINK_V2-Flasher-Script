#Flasher script for nordic nRF51822 BLE IC

##What it does
This script allow any people developing with the nRF51822 to easly flash the IC with a custom firmware, using the ST-LINK V2 programmer available for less than 2$ on aliexpress and less than 8$ worldwide.

The script automatically pick up the last .hex file added in the folder, so if you're developing with mbed (an online ide, that download automatically the .hex file after compiling) you can flash the chip istantaneusly.

Generally, you will want to use the script from your download folder.



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
The S110 7.x version is suggested if you're developing in the mbed online IDE.

Place the .hex file in the ZIP your just downloaded in the download folder (together with the script) and rename it "softdevice.hex"

After compiling on the mbed online ide the file will be automatically downloaded, and you can just run:

```Shell

cd /path/to/your/download/folder
./flasher.sh

```

Openocd will remain open to allow the chip to run, otherwise it will stay idle. To exit from openocd, just press control+C . You can now simply relaunch the script to re-flash your device (up-arrow, then press enter on most terminal software).

##Doing it manually, without the script

If you want to manually run the commands here they are. 

In a terminal windows, run:
```Shell

openocd -f interface/stlink-v2.cfg -f target/nrf51.cfg -c "init"

```
Now leave the window open and in another one run in succession:
```Shell

telnet localhost 4444 #login into openocd commandline
halt
nrf51 mass_erase 
program path/to/your/softdevice.hex verify
program path/to/your/firmware.hex
resume 

```

if you want to safely close openocd:
```Shell

shutdown

```

##Wiring
In order to flash the nrf51822 you only need to connect the power supply (GND and 3.3V) and SWCLK and SWDIO lines.
There is no need to connect the RST or SWIM lines. Beware that the nrf51822 CANNOT be powered from 5V.

##Running the IC without an attached programmer
After you've programmed the IC, disconnect the SWCLK and SWDIO lines and disconnect and reconnect VCC or GND to power cycle it. Without the external clock from the programmer the IC will run normally.




