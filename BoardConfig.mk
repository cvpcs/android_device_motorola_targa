# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/motorola/targa/BoardConfigVendor.mk

# use charge_counter for battery
BOARD_USE_BATTERY_CHARGE_COUNTER := true

TARGET_BOARD_PLATFORM := omap4

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon

TARGET_NO_BOOTLOADER := false
TARGET_BOOTLOADER_BOARD_NAME := targa

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := tiwlan0
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/wilink_6_1
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_FIRMWARE_LOADER        := "wlan_loader"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/fw_wlan1281.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/fw_wlan1281_AP.bin"

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BOARD_WITH_ALSA_UTILS := true

BOARD_KERNEL_CMDLINE := console=/dev/null rw mem=1024M@0x80000000 vram=20M omapgpu.vram=0:4M,1:16M,2:16MT init=/init ip=off brdrev=P2B omap3_die_id androidboot.bootloader=0x0000 mmcparts=mmcblk1:p7(pds),p15(boot),p16(recovery),p17(cdrom),p18(misc),p19(cid),p20(kpanic),p21(system),p22(cache),p23(preinstall),p24(webtop),p25(userdata),p26(emstorage)
BOARD_KERNEL_BASE := 0x10000000

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_EGL_CFG := device/motorola/targa/egl.cfg

#BOARD_HAS_SDCARD_INTERNAL := true
#BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1
#BOARD_SDCARD_DEVICE_SECONDARY :=
#BOARD_SDCARD_DEVICE_INTERNAL :=
#BOARD_VOLD_MAX_PARTITIONS :=
#BOARD_VOLD_EMMC_SHARES_DEV_MAJOR :=

#BOARD_BOOTIMAGE_PARTITION_SIZE := 0x003fffff
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x004fffff
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0cdfffff   # limited so we enforce room to grow
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

# some stuff for recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/motorola/targa/recovery/graphics.c
BOARD_HAS_NO_SELECT_BUTTON := true

TARGET_PREBUILT_KERNEL := device/motorola/targa/kernel

#TARGET_NO_RECOVERY := true
TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/targa/kernel

HARDWARE_OMX := true

ifndef targa_DEV_PHONE
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/motorola/targa/releasetools/targa_ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := device/motorola/targa/releasetools/targa_img_from_target_files

#BOARD_HIJACK_LOG_ENABLE := true

# targa requires the common boot hijack
TARGET_NEEDS_MOTOROLA_HIJACK := true

TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /data/.recovery_mode; sync;"
TARGET_RECOVERY_PRE_COMMAND_CLEAR_REASON := true
endif

BOARD_ALWAYS_INSECURE := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_MKE2FS := device/motorola/targa/mke2fs
