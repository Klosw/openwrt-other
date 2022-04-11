dts文件放入<br>
./target/linux/ath79/dts/<br>

再这个文件写入 <br>
./target/linux/ath79/image/generic-tp-link.mk<br>
<br>
修改默认ip
<br>
sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
<br>

```
define Device/tplink_tl-wr720n-v3 
  $(Device/tplink-16mlzma) 
  SOC := ar9331
  DEVICE_MODEL := TL-WR720N
  DEVICE_VARIANT := v3
  DEVICE_PACKAGES := kmod-usb-chipidea2 kmod-usb-ledtrig-usbport
  TPLINK_HWID := 0x07200103
  SUPPORTED_DEVICES += tl-wr720n
endef
TARGET_DEVICES += tplink_tl-wr720n-v3
```
