#
# Copyright (C) 2016 The Android Open-Source Project
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

TARGET_CHIPSET := sdm710
LOCAL_PATH := device/motorola/astro

PRODUCT_SOONG_NAMESPACES += \
    device/motorola/astro \
    hardware/qcom/sdm845 \
    vendor/google/camera \
    vendor/qcom/sdm845

# Full phone functionality without sim card
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

# FBE. TODO: See https://source.android.com/security/encryption/file-based "Adaptable Storage"
PRODUCT_PROPERTY_OVERRIDES += ro.crypto.volume.filenames_mode=aes-256-cts

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/default-permissions.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default-permissions/default-permissions.xml \
    $(LOCAL_PATH)/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.verified_boot.xml

# Props
TARGET_PRODUCT_PROP := $(LOCAL_PATH)/product.prop

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# For build without vendor
ifeq ($(wildcard vendor/motorola/astro/proprietary/device-vendor-astro.mk),)
    BUILD_WITHOUT_VENDOR := true
endif

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)/kernel/Image.gz
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_SHIPPING_API_LEVEL := 28

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay


# Mod: ar, camera.autofocus, camera.concurrent, camera.external, camera.manual_postprocessing, hardware.context_hub
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.ar.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.ar.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.concurrent.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.concurrent.xml \
    frameworks/native/data/etc/android.hardware.camera.external.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.external.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml\
	frameworks/native/data/etc/android.hardware.camera.manual_postprocessing.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml\
	frameworks/native/data/etc/android.hardware.context_hub.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.context_hub.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
	frameworks/native/data/etc/android.hardware.reboot_escrow.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.reboot_escrow.xml \
	frameworks/native/data/etc/android.hardware.screen.landscape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.landscape.xml \
	frameworks/native/data/etc/android.hardware.screen.portrait.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.portrait.xml \
	frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
	frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.assist.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.assist.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \   
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
	frameworks/native/data/etc/android.hardware.strongbox_keystore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.strongbox_keystore.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \	
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
	frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \ 
	frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \

# powerstats HAL
PRODUCT_PACKAGES += \
    android.hardware.power.stats@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# perfstatsd
PRODUCT_PACKAGES_DEBUG += \
    perfstatsd

# Audio fluence, ns, aec property, voice and media volume steps
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.audio.sdk.fluencetype=fluencepro \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.speaker=true \
    persist.audio.fluence.voicecomm=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.dualmic.config=endfire \
    persist.audio.in_mmap_delay_micros=100 \
    persist.audio.out_mmap_delay_micros=150 \
    ro.config.vc_call_vol_steps=7 \
    ro.config.media_vol_steps=25 \
    vendor.audio.offload.gapless.enabled=true \

# MaxxAudio effect and add rotation monitor
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.monitorRotation=true \
	ro.audio.monitorOrientation=true

PRODUCT_PACKAGES += \
	libmalistener

# graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610 # Opengl ES 3.2

# camera google face detection
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.googfd.enable=1

# Enable logical camera as default (camera id 1)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.logical.default=1

# logical camera for dual front sensors
PRODUCT_PROPERTY_OVERRIDES += \
  persist.vendor.camera.multicam=1

# OEM Unlock reporting
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=1 \
    persist.vendor.data.iwlan.enable=true \
    persist.radio.RATE_ADAPT_ENABLE=1 \
    persist.radio.ROTATION_ENABLE=1 \
    persist.radio.VT_ENABLE=1 \
    persist.radio.VT_HYBRID_ENABLE=1 \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.custom_ecc=1 \
    persist.vendor.radio.data_ltd_sys_ind=1 \
    persist.radio.videopause.mode=1 \
    persist.vendor.radio.mt_sms_ack=30 \
    persist.vendor.radio.multisim_switch_support=true \
    persist.vendor.radio.sib16_support=1 \
    persist.vendor.radio.data_con_rprt=true \
    persist.vendor.radio.relay_oprt_change=1 \
    persist.vendor.radio.sap_silent_pin=1 \
    persist.vendor.radio.no_wait_for_card=1 \
    persist.vendor.radio.manual_nw_rej_ct=1 \
    persist.rcs.supported=1 \
    vendor.rild.libpath=/vendor/lib64/libril-qc-hal-qmi.so \
    ro.hardware.keystore_desede=true \

# Enable reboot free DSDS
PRODUCT_PRODUCT_PROPERTIES += \
    persist.radio.reboot_on_modem_change=false

# Logical modems can be active simultaneously
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.active_modems.max_count=2

# Disable snapshot timer
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.snapshot_enabled=0 \
    persist.vendor.radio.snapshot_timer=0



PRODUCT_PACKAGES += \
    hwcomposer.$(TARGET_CHIPSET) \
    android.hardware.graphics.composer@2.4-service \
    gralloc.$(TARGET_CHIPSET) \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    vendor.qti.hardware.display.allocator@1.0-service # Qcom gralloc

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl

# Storage health HAL
PRODUCT_PACKAGES += \
    android.hardware.health.storage@1.0-service


# Light HAL
PRODUCT_PACKAGES += \
    lights.$(TARGET_CHIPSET) \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# Memtrack HAL
PRODUCT_PACKAGES += \
    memtrack.$(TARGET_CHIPSET) \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

# Bluetooth HAL
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1-impl-qti \
    android.hardware.bluetooth@1.1-service-qti

# Bluetooth SoC
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=cherokee # cherokee = WCN3990

# DRM HAL
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.3-service.clearkey \
    android.hardware.drm@1.3-service.widevine

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.2-service

# Hardware Video Decoding
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libc2dcolorconvert

# Enable Codec 2.0
PRODUCT_PROPERTY_OVERRIDES += \
    debug.media.codec2=2 \

# Create input surface on the framework side
PRODUCT_PROPERTY_OVERRIDES += \
    debug.stagefright.c2inputsurface=-1 \

PRODUCT_PACKAGES += \
    libqcodec2 \
    vendor.qti.media.c2@1.0-service \
    media_codecs_c2.xml \
    codec2.vendor.ext.policy \
    codec2.vendor.base.policy

# Camera HAL
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.6-impl \
    android.hardware.camera.provider@2.6-service_64 \
    camera.device@3.6-impl \
    camera.sdm710 \
    libqomx_core \
    libmmjpeg_interface \
    libmmcamera_interface \
    libcameradepthcalibrator

# Google Camera HAL test libraries in debug builds
PRODUCT_PACKAGES_DEBUG += \
    libgoogle_camera_hal_proprietary_tests \
    libgoogle_camera_hal_tests.vendor

PRODUCT_PACKAGES += \
    sensors.$(PRODUCT_HARDWARE) \
    android.hardware.sensors@2.1-impl \
    android.hardware.sensors@2.1-service \
    android.hardware.sensors@2.1-service.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:vendor/etc/sensors/hals.conf

# Default permission grant exceptions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/default-permissions.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default-permissions/default-permissions.xml

PRODUCT_PACKAGES += \
    fs_config_dirs \
    fs_config_files

# Context hub HAL
PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.1-service.generic

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-impl.recovery \
    android.hardware.boot@1.1-service \

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/thermal/thermal_info_config_$(PRODUCT_HARDWARE).json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

#GNSS HAL
PRODUCT_PACKAGES += \
    libgps.utils \
    libgnss \
    liblocation_api \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti

ENABLE_VENDOR_RIL_SERVICE := true

HOSTAPD := hostapd
HOSTAPD += hostapd_cli
PRODUCT_PACKAGES += $(HOSTAPD)

WPA := wpa_supplicant.conf
WPA += wpa_supplicant_wcn.conf
WPA += wpa_supplicant
PRODUCT_PACKAGES += $(WPA)

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PACKAGES += wpa_cli
endif

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.4-service \
    wificond \
    libwpa_client \
    WifiOverlay

LIB_NL := libnl_2
PRODUCT_PACKAGES += $(LIB_NL)

# WLAN driver configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi_concurrency_cfg.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wifi_concurrency_cfg.txt \
    $(LOCAL_PATH)/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini \


# Audio effects
PRODUCT_PACKAGES += \
    libvolumelistener \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle

PRODUCT_PACKAGES += \
    audio.primary.sdm710 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    audio.hearing_aid.default \
    audio.bluetooth.default

PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl:32 \
    android.hardware.audio.effect@6.0-impl:32 \
    android.hardware.soundtrigger@2.3-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.audio@6.0-service

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PACKAGES += \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo \
    cplay
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Audio XMLs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \

# audio hal tables
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/audio/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \

PRODUCT_PROPERTY_OVERRIDES += \
    audio.snd_card.open.retries=50

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf

# GPS configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf

# Vendor seccomp policy files for media components:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
# Subsystem ramdump
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sys.ssr.enable_ramdumps=1
endif

# Subsystem silent restart
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sys.ssr.restart_level=modem,slpi,adsp

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
# Sensor debug flag
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.debug.ash.logger=0 \
    persist.vendor.debug.ash.logger.time=0
endif

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(PRODUCT_PLATFORM) \
    $(LOCAL_PATH)/fstab.qcom:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.$(PRODUCT_PLATFORM) \

# Use the default charger mode images
PRODUCT_PACKAGES += \
    charger_res_images

ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
# b/36703476: Set default log size to 1M
PRODUCT_PROPERTY_OVERRIDES += \
  ro.logd.size=1M
# b/114766334: persist all logs by default rotating on 30 files of 1MiB
PRODUCT_PROPERTY_OVERRIDES += \
  logd.logpersistd=logcatd \
  logd.logpersistd.size=30
endif

# Dumpstate HAL
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.1-service

# Citadel
PRODUCT_PACKAGES += \
    citadeld \
    citadel_updater \
    android.hardware.authsecret@1.0-service.citadel \
    android.hardware.oemlock@1.0-service.citadel \
    android.hardware.weaver@1.0-service.citadel \
    android.hardware.keymaster@4.1-service.citadel \
    android.hardware.identity@1.0-service.citadel \
    wait_for_strongbox

# Citadel debug stuff
PRODUCT_PACKAGES_DEBUG += \
    test_citadel

# Storage: for factory reset protection feature
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

PRODUCT_PACKAGES += \
    vndk-sp

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hidl/android.hidl.base@1.0.so-64:vendor/lib64/android.hidl.base@1.0.so \
#    $(LOCAL_PATH)/hidl/android.hidl.base@1.0.so-64:system_ext/lib64/android.hidl.base@1.0.so \


PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

#Set default CDMA subscription to RUIM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_cdma_sub=0

# Set network mode to Global by default and no DSDS/DSDA
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.default_network=10

# Set display color mode to Automatic by default
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.sf.color_saturation=1.0 \
    persist.sys.sf.native_mode=2

# Easel device feature. TODO: Only for pixels from 2018
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.google.hardware.camera.easel_2018.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.google.hardware.camera.easel_2018.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.2-service
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fingerprint/init.fingerprint.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.fingerprint.sh \

# Keymaster configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.hardware.device_unique_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.device_unique_attestation.xml

# Enable modem logging
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.log_loc="/data/vendor/modem_dump" \
    ro.radio.log_prefix="modem_log_"

# Enable modem logging for debug
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sys.modem.diag.mdlog=true
else
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sys.modem.diag.mdlog=false
endif
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sys.modem.diag.mdlog_br_num=5

# Enable tcpdump_logger on userdebug and eng
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    PRODUCT_PROPERTY_OVERRIDES += \
        persist.vendor.tcpdump.log.alwayson=false \
        persist.vendor.tcpdump.log.br_num=5
endif

# Enable stats logging in LMKD
TARGET_LMKD_STATS_LOG := true
PRODUCT_PRODUCT_PROPERTIES += \
    ro.lmk.log_stats=true

# default usb oem functions
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
  PRODUCT_PROPERTY_OVERRIDES += \
      persist.vendor.usb.usbradio.config=diag
endif

#Enable QTI KEYMASTER and GATEKEEPER HIDLs
KMGK_USE_QTI_SERVICE := true

# Early phase offset configuration for SurfaceFlinger
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_phase_offset_ns=1500000
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_app_phase_offset_ns=1500000
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_gl_phase_offset_ns=3000000
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.early_gl_app_phase_offset_ns=15000000


# Enable backpressure for GL comp
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.enable_gl_backpressure=1

# Do not skip init trigger by default
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    vendor.skip.init=0

# Atrace HAL
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl \
    fastbootd

# GTS ACSA(Agreement for Carrier Service Application) verification
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.acsa=true

# Increment the SVN for any official public releases
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.build.svn=38

# Vendor verbose logging default property
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.verbose_logging_enabled=true
else
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.verbose_logging_enabled=false
endif

