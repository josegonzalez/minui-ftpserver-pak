# minui-ftpserver.pak

A MinUI app that starts a [fclairamb/ftpserver](https://github.com/fclairamb/ftpserver), an ftp server.

## Requirements

This pak is designed and tested on the following MinUI Platforms and devices:

- `miyoomini`: Miyoo Mini Plus (_not_ the Miyoo Mini)
- `my282`: Miyoo A30
- `my355`: Miyoo Flip
- `tg5040`: Trimui Brick (formerly `tg3040`), Trimui Smart Pro
- `rg35xxplus`: RG-35XX Plus, RG-34XX, RG-35XX H, RG-35XX SP

Use the correct platform for your device.

## Installation

1. Mount your MinUI SD card.
2. Download the latest release from Github. It will be named `FTP.Server.pak.zip`.
3. Copy the zip file to `/Tools/$PLATFORM/FTP Server.pak.zip`. Please ensure the new zip file name is `FTP Server.pak.zip`, without a dot (`.`) between the words `FTP` and `Server`.
4. Extract the zip in place, then delete the zip file.
5. Confirm that there is a `/Tools/$PLATFORM/FTP Server.pak/launch.sh` file on your SD card.
6. Unmount your SD Card and insert it into your MinUI device.

## Usage

> [!IMPORTANT]
> If the zip file was not extracted correctly, the pak may show up under `Tools > FTP`. Rename the folder to `FTP Server.pak` to fix this.

Browse to `Tools > FTP Server` and press `A` to enter the Pak.

This pak runs on ports `21` (FTP) with the passive transfer port range of `2122-2130`.

The default credentials are:

- `minui:minui`

### Debug Logging

Debug logs are written to the`$SDCARD_PATH/.userdata/$PLATFORM/logs/` folder.
