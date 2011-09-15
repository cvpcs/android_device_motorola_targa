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
PRODUCT_PROPERTY_OVERRIDES +=
    ro.com.google.clientidbase.ms=android-verizon \
    ro.com.google.clientidbase.am=android-verizon \
    ro.com.google.clientidbase.gmm=android-motorola \
    ro.com.google.clientidbase.yt=android-verizon \
    ro.kernel.android.ril=yes \
    persist.ril.mux.noofchannels=10 \
    persist.ril.mux.ttydevice=/dev/ttyO0 \
    persist.ril.modem.ttydevice=/dev/ttyUSB4 \
    persist.ril.tcmd.ttydevice=/dev/usb/tty2-1:1.3 \
    persist.ril.features=0x90A \
    persist.ril.mux.retries=500 \
    persist.ril.mux.sleep=2 \
    rild.libpath=/system/lib/moto-ril-multimode.so \
    ro.default_usb_mode=0 \
    ro.media.enc.aud.fileformat=qcp \
    ro.media.enc.aud.codec=qcelp \
    ro.media.enc.aud.bps=13300 \
    ro.media.enc.aud.ch=1 \
    ro.media.enc.aud.hz=8000 \
    ro.com.google.gmsversion=2.3_r6 \
    ro.mot.phonemode.vzw4gphone=1 \
    ro.mot.lte_on_cdma=1 \
    lte_ril.libpath=/system/lib/lib-mot-lte-ril.so \
    cdma_ril.libpath=/system/lib/libmoto_ril.so \
    ril.rat=LTE \
    lte_ril.netcfg_to=90 \
    ro.mot.tmp.telephony.refactor=true \
    ro.cdma.subscription=0 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=3000 \
    ro.setupwizard.enable_bypass=1 \
    ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
    ro.cdma.data_retry_config=default_randomization=2000,max_retries=infinite,0,0,120000,180000,540000,960000 \
    ro.gsm.data_retry_config=default_randomization=2000,max_retries=infinite,0,0,80000,125000,485000,905000 \
    ro.gsm.2nd_data_retry_config=max_retries=1,15000 \
    ro.media.camcorder.1080p=mp4,h264,30,15000000,aac,128000,44100,2 \
    ro.media.camcorder.720p=mp4,h264,30,10000000,aac,128000,44100,2 \
    ro.media.camcorder.d1NTSC=mp4,h264,30,6000000,aac,128000,44100,2 \
    ro.media.camcorder.vga=mp4,h264,30,4000000,aac,128000,44100,2 \
    ro.media.camcorder.cif=mp4,h264,30,1500000,aac,128000,44100,2 \
    ro.media.camcorder.qvga=mp4,h264,15,500000,aac,64000,44100,2 \
    ro.media.camcorder.mms=3gp,h264,15,128000,amrnb,12200,8000,1 \
    ro.media.camcorder.mmsres=qvga \
    ro.camcorder.zoom=true \
    ro.media.capture.maxres=8m \
    ro.media.capture.fast.fps=4 \
    ro.media.capture.slow.fps=120 \
    ro.media.capture.flash=led \
    ro.media.capture.flashMinV=3300000 \
    ro.media.capture.torchIntensity=40 \
    ro.media.capture.flashIntensity=70 \
    ro.media.panorama.defres=3264x1840 \
    ro.media.panorama.frameres=1280x720 \
    ro.camcorder.videoModes=false \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-record=false \
    ro.media.camera.focal=3451.0,3451.0 \
    ro.media.camera.principal=1632.0,1224.0 \
    ro.media.camera.skew=0.0 \
    ro.media.camera.distortion=0.0,0.0,0.0,0.0,0.0 \
    ro.media.camera.calresolution=3264,2448 \
    ro.mot.setuptype=2 \
    ro.HorizontalBUA=true \
    ro.HorizontalVVM=true \
    ro.horizontalIM=true \
    ro.horizontalNGM=false \
    ro.horizontalVMM=false \
    ro.horizontalMOD=false \
    ro.horizontalVOD=false \
    ro.horizontalEmail=false \
    ro.mot.internalsdcard=1 \
    ro.mot.dpmext=true \
    ro.com.google.clientid=android-motorola \
    ro.mot.hw.uaprof=http://uaprof.motorola.com/phoneconfig/MotoMB200/profile/MotoMB200.rdf \
    ro.build.version.full=Blur_Version.5.5.886.XT875.Verizon.en.US \
    ro.mot.hidden_keyboards=evfwd

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

PRODUCT_PACKAGES += \
    librs_jni \
    libOMX_Core \
    libVendor_ti_omx \
    libVendor_ti_omx_config_parser \
    libreference-ril \
    libreference-cdma-sms \
    Usb
#    dspexec \
#    libbridge \
#    libLCML \

# wifi stuff
PRODUCT_PACKAGES += \
    tiwlan.ini \
    wlan_cu \
    wlan_loader \
    wpa_supplicant.conf \
    dhcpcd.conf
    libtiOsLib \
    libCustomWifi \


# hw libs
PRODUCT_PACKAGES += \
    alsa.default \
    acoustics.default \
    overlay.omap4
#    sensors.targa \
#    lights.targa \


# omap4 stuff
#PRODUCT_PACKAGES += \
#    syslink_daemon.out


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
