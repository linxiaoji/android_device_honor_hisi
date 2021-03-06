

LOCAL_PATH := device/honor/hisi/hi3650

$(call inherit-product-if-exists, vendor/honor/hisi/hi3650/vendor.mk)

PRODUCT_COPY_FILES += $(LOCAL_PATH)/kernel:kernel

PRODUCT_PACKAGES += libhisi

# Vendor Interface Manifest
PRODUCT_COPY_FILES += \
    device/honor/hisi/hi3650/manifest.xml:vendor/manifest.xml

DEVICE_PACKAGE_OVERLAYS := \
    device/honor/hisi/hi3650/overlay

# Ramdisk
PRODUCT_COPY_FILES +=   $(LOCAL_PATH)/fstab.hi3650:root/fstab.hi3650 \
			$(LOCAL_PATH)/init.hi3650.rc:root/init.hi3650.rc \
			$(LOCAL_PATH)/init.hi3650.gps.rc:root/init.hi3650.gps.rc \
			$(LOCAL_PATH)/init.hi3650.usb.configfs.rc:root/init.hi3650.usb.configfs.rc \
			$(LOCAL_PATH)/ueventd.hi3650.rc:root/ueventd.hi3650.rc

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.build.subproduct=F2FS \
    ro.magic.api.version=0.1 \
    ro.enable_boot_charger_mode=0 \
    persist.sys.usb.config=mtp \
    sys.usb.config=mtp \
    sys.usb.configfs=1 \
    sys.usb.controller=ff100000.dwc3 \
    persist.sys.sdcardfs=force_off \
    qemu.hw.mainkeys=0

PRODUCT_PACKAGES += android.hardware.usb@1.0-service

# Bluetooth
PRODUCT_PACKAGES += \
	android.hardware.bluetooth@1.0-impl \
	android.hardware.bluetooth@1.0-service \
	libbt-vendor

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init/vendor.huawei.audio@2.0-service.rc:vendor/etc/init/vendor.huawei.audio@2.0-service.rc \
	$(LOCAL_PATH)/prebuilts/audio_policy.conf:vendor/etc/audio_policy.conf \
	$(LOCAL_PATH)/prebuilts/audio_effects.conf:vendor/etc/audio_effects.conf \
	$(LOCAL_PATH)/prebuilts/audio_policy_configuration.xml:vendor/etc/audio_policy_configuration.xml \
	$(LOCAL_PATH)/prebuilts/audio_policy_volumes_drc.xml:vendor/etc/audio_policy_volumes_drc.xml \
	$(LOCAL_PATH)/prebuilts/default_volume_tables.xml:vendor/etc/default_volume_tables.xml \
	$(LOCAL_PATH)/prebuilts/r_submix_audio_policy_configuration.xml:system/etc/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/etc/a2dp_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.broadcastradio@1.1-impl \
    android.hardware.broadcastradio@1.1 \
    android.hardware.soundtrigger@2.0-impl \
    android.hardware.media.omx@1.0 \
    libtinyalsa \
    libaudioroute \
    audio.a2dp.default

# Camera
PRODUCT_PROPERTY_OVERRIDES += camera.disable_treble=true

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Gatekeeper & Keymaster

PRODUCT_PACKAGES += android.hardware.keymaster@3.0-service android.hardware.gatekeeper@1.0-service android.hardware.gatekeeper@1.0-impl

# GPS
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init/vendor.huawei.hardware.gnss@1.0-service.rc:vendor/etc/init/vendor.huawei.hardware.gnss@1.0-service.rc \
	 frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

PRODUCT_PACKAGES += \
	android.hardware.gnss@1.0-impl \
	android.hardware.gnss@1.0-service

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    android.hardware.nfc@1.0-impl \
    android.hardware.nfc@1.0 \
    nfc_nci.pn54x.default

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
	$(LOCAL_PATH)/prebuilts/libnfc-brcm.conf:system/etc/libnfc-brcm.conf

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
	rild.libargs=-m modem0 \
	ro.multi.rild=false \
	ro.config.is_start_commril=true \
	ro.config.default_commril_mode=ULG_MODE \
	persist.dsds.enabled=false \
	ro.config.modem_number=1 \
	ro.config.hw_dsda=false \
	ro.config.full_network_support=false \
	ro.config.client_number=1 \
	ro.config.hw_save_pin=true \
	rild.rild1_ready_to_start=false \
	rild.libpath=/vendor/lib64/libbalong-ril.so \
	ro.telephony.default_network=9 \
	persist.radio.modem.cap=8999D

PRODUCT_PACKAGES += android.hardware.radio@1.0

# Sensors
PRODUCT_PACKAGES += android.hardware.sensors@1.0

PRODUCT_COPY_FILES += $(LOCAL_PATH)/init/vendor.huawei.hardware.sensors@1.0-service.rc:vendor/etc/init/vendor.huawei.hardware.sensors@1.0-service.rc

# Usb
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.magic.api.version=0.1 \
    ro.enable_boot_charger_mode=0 \
    persist.sys.usb.config=manufacture,adb \
    sys.usb.configfs=1 \
    sys.usb.controller=ff100000.dwc3

# Vibrator
PRODUCT_PACKAGES += \
	android.hardware.vibrator@1.0-service \
	android.hardware.vibrator@1.0-impl

# Wifi
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	$(LOCAL_PATH)/init/vendor.huawei.hardware.wifi@1.0-service.rc:vendor/etc/init/vendor.huawei.hardware.wifi@1.0-service.rc \
	$(LOCAL_PATH)/init/connectivity.rc:vendor/etc/init/connectivity.rc

PRODUCT_PACKAGES += \
	libwpa_client \
	lib_driver_cmd_bcmdhd \
	hostapd \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf \
	wificond \
	wifilogd

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/Android.mk)

# Launcher
PRODUCT_PACKAGES += Launcher3

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
	frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
	frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

# HWUI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=72 \
    ro.hwui.layer_cache_size=48 \
    ro.hwui.path_cache_size=32 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

