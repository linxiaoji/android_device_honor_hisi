include device/honor/hisi/BoardConfigCommon.mk

TARGET_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT := generic

TARGET_BOARD_PLATFORM := hi3650

BOARD_KERNEL_CMDLINE := loglevel=6 page_tracker=on androidboot.selinux=permissive

TARGET_RECOVERY_FSTAB := device/honor/hisi/hi3650/fstab.hi3650

BOARD_KERNEL_BASE := 0x00478000
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x07588000

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3154116608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25862078464
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_VENDORIMAGE_PARTITION_SIZE := 637534208
BOARD_PERSISTIMAGE_PARTITION_SIZE := 2097152
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USES_OVERLAY := true

# SeLinux
BOARD_SEPOLICY_DIRS += device/honor/hisi/hi3650/sepolicy

# Audio
BOARD_USES_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
USE_BLUETOOTH_BCM4343 := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/honor/hisi/hi3650/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/honor/hisi/hi3650/bluetooth/vnd_hi3650.txt

# Camera
USE_CAMERA_V4L2_HAL := true

# HWUI
HWUI_COMPILE_SYMBOLS := true

# NFC
BOARD_NFC_CHIPSET := pn548
TARGET_USES_NQ_NFC := true

# Wifi
TARGET_USES_64_BIT_BCMDHD	 := true
BOARD_WLAN_DEVICE		 := bcmdhd
BOARD_WLAN_DEVICE_REV		 := bcm4345
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_PRIVATE_LIB	 := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM	 := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA		 := "/vendor/firmware/fw_bcm43455_hw.bin"
WIFI_DRIVER_FW_PATH_AP		 := "/vendor/firmware/fw_bcm43455_apsta_hw.bin"
WIFI_DRIVER_FW_PATH_P2P		 := "/vendor/firmware/fw_bcm43455_hw.bin"
WIFI_BAND			 := 802_11_ABG
