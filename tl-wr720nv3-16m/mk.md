再这个文件写入 <br>
./target/linux/ath79/image/generic-tp-link.mk<br>
<br>
<br>
<br>
<br>
<br>
define Device/tplink_tl-wr720n-v3<br>
  $(Device/tplink-16mlzma)<br>
  SOC := ar9331<br>
  DEVICE_MODEL := TL-WR720N<br>
  DEVICE_VARIANT := v3<br>
  DEVICE_PACKAGES := kmod-usb-chipidea2 kmod-usb-ledtrig-usbport<br>
  TPLINK_HWID := 0x07200103<br>
  SUPPORTED_DEVICES += tl-wr720n<br>
endef<br>
TARGET_DEVICES += tplink_tl-wr720n-v3<br>
