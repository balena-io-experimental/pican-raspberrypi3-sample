# PiCAN MCP2515 Hat with Raspberry Pi 3B

## Overview

This project documents the required steps to get your MCP2515-based PiCAN board working easily on a Raspberry Pi 3B. It includes a sample service named `pican` which will dump the frames received on the CANBUS to the `stdout` log; which is shown on the balenaCloud dashboard.

The project is fairly simple, but is quite small to account for this:

```
[Info]     ┌─────────┬────────────┬────────────┐
[Info]     │ Service │ Image Size │ Build Time │
[Info]     ├─────────┼────────────┼────────────┤
[Info]     │ pican   │ 169.83 MB  │ 55 seconds │
[Info]     └─────────┴────────────┴────────────┘
```

## Getting Started

### 1. Create a balenaCloud application

I suggest a multicontainer/starter application type, and chose `Raspberry Pi 3` as the device type. Once this is created we need to configure some settings for the device hosts.

Once created, add a new device and download the host disk image. This should be written to the SD card using balenaEtcher and then the device can be booted properly. Make sure your PiCAN hat is connected correctly to the 40-pin GPIO.

### 2. Configure the `dtoverlay` parameters

The MCP2515 chip on the PiCAN board is supported in balenaOS natively, but it needs to be enabled at boot. This is done by configuring the `dtoverlay` parameters in the `Device Configuration` menu of the application in balenaCloud.

Add a custom variable named `RESIN_HOST_CONFIG_dtoverlay` and set the value to be `"mcp2515-can0,oscillator=16000000,interrupt=25","spi-bcm2835-overlay"` including the quotes, and the quote in between. This will be added to the device' `config.txt` when it connects and pulls down the configuration.

## 2a. (Optional) Configure the CANBUS bitrate

By default the interface will be configured for 500Kbps but this can be changed by adding a `Device variable`. The name of it should be `BITRATE` and the value should be a number in `bps`, so for a `10Kbps` rate the value would be `10000`.

## 3. Push the sample code

Using the balenaCLI, push the sample project to your application. It should be built on our cloud builders and then downloaded by any running devices.

## 4. Done

Hook your PiCAN onto a CANBUS and see what frames get logged in the dashboard.