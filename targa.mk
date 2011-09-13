#
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

#
# This is the product configuration for a generic CDMA targa,
# not specialized for any geography.
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to CDMA

PRODUCT_COPY_FILES += \
    device/motorola/targa/init.mapphone_cdma.rc:root/init.mapphone_cdma.rc \
    device/motorola/targa/ueventd.mapphone_cdma.rc:root/ueventd.mapphone_cdma.rc

## (2) Also get non-open-source CDMA-specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/targa/targa-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-CDMA-specific aspects
#PRODUCT_PROPERTY_OVERRIDES +=

DEVICE_PACKAGE_OVERLAYS += device/motorola/targa/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/motorola/targa/media_profiles.xml:system/etc/media_profiles.xml

#PRODUCT_PACKAGES += \
#    librs_jni \
#    tiwlan.ini \
#    dspexec \
#    libbridge \
#    overlay.omap4 \
#    wlan_cu \
#    libtiOsLib \
#    wlan_loader \
#    libCustomWifi \
#    wpa_supplicant.conf \
#    dhcpcd.conf \
#    libOMX.TI.AAC.encode \
#    libOMX.TI.AMR.encode \
#    libOMX.TI.WBAMR.encode \
#    libOMX.TI.JPEG.Encoder \
#    libLCML \
#    libOMX_Core \
#    libOMX.TI.Video.Decoder \
#    libOMX.TI.Video.encoder \
#    libVendor_ti_omx \
#    sensors.targa \
#    lights.targa \
#    libaudiopolicy \
#    Usb

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# targa uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/motorola/targa/vold.fstab:system/etc/vold.fstab \
    device/motorola/targa/apns-conf.xml:system/etc/apns-conf.xml \
    device/motorola/targa/mount_ext3.sh:system/bin/mount_ext3.sh

# these need to be here for the installer, just put them here for now
PRODUCT_PACKAGES += \
    targa_releaseutils-check_kernel \
    targa_releaseutils-finalize_release \
    targa_releaseutils-mke2fs \
    targa_releaseutils-tune2fs \

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/motorola/targa/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/targa/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/motorola/targa/targa-vendor.mk)

# stuff common to all Motorola phones
$(call inherit-product, device/motorola/common/common_hijack.mk)

$(call inherit-product, build/target/product/full_base.mk)


PRODUCT_NAME := generic_targa
PRODUCT_DEVICE := targa
