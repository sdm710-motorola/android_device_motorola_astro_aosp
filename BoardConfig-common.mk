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

LOCAL_PATH := device/motorola/astro

TARGET_BOARD_PLATFORM := sdm710

TARGET_BOARD_INFO_FILE := $(LOCAL_PATH)/board-info.txt

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := generic
TARGET_CPU_VARIANT := kryo385
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75
TARGET_BOARD_SUFFIX := _64

TARGET_BOARD_COMMON_PATH := $(LOCAL_PATH)/sdm710


BUILD_BROKEN_DUP_RULES := true

# Kernel - CMDLINE
BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200,n8 \
    androidboot.hardware=qcom  \
    androidboot.console=ttyMSM0 \
    androidboot.memcg=1 \
    lpm_levels.sleep_disabled=1 \
    video=vfb:640x400,bpp=32,memsize=3072000 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    swiotlb=1 \
    earlycon=msm_geni_serial,0xA84000 \
    ehci-hcd.park=3 \
    androidboot.configfs=true \
    cgroup.memory=nokmem,nosocket \
    androidboot.usbcontroller=a600000.dwc3 \
    printk.devkmsg=on \
    androidboot.hab.csv=10 \
    androidboot.hab.product=astro \
    androidboot.hab.cid=50 \
    firmware_class.path=/vendor/firmware_mnt/image \
    androidboot.fastboot=1 \
    androidboot.selinux=permissive

# Kernel - Mkbootimg Args
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100

BOARD_MKBOOTIMG_ARGS += \
    --header_version $(BOARD_BOOTIMG_HEADER_VERSION) \
    --base $(BOARD_KERNEL_BASE) \
    --dtb_offset $(BOARD_DTB_OFFSET) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --pagesize $(BOARD_KERNEL_PAGESIZE) \
    --second_offset $(BOARD_KERNEL_SECOND_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Kernel - Instructions
TARGET_KERNEL_VERSION := 4.9
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

# Kernel - Prebuilt
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/astro/prebuilt/Image.gz
BOARD_KERNEL_IMAGE_NAME := Image.gz

# Kernel - Include DTBO
BOARD_PREBUILT_DTBOIMAGE := $(LOCAL_PATH)/astro/prebuilt/dtbo.img

# Kernel - Include DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_PREBUILD_DTB := $(LOCAL_PATH)/astro/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += \
	--dtb $(TARGET_PREBUILD_DTB)

# A/B OTA Updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    recovery \
    system \
    vendor \
    vbmeta

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4

# system.img
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# persist.img
BOARD_PERSISTIMAGE_PARTITION_SIZE := 41943040
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

# boot.img
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864

# Super Partition
BOARD_SUPER_PARTITION_SIZE := 8925478912
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 4341104640
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    product \
    vendor

# Partition - Types
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_METADATA_PARTITION := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_USES_MKE2FS := true

TARGET_FS_CONFIG_GEN := $(LOCAL_PATH)/config.fs

QCOM_BOARD_PLATFORMS += sdm710
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_USES_COMMON_BLUETOOTH_HAL := true

# Camera
TARGET_USES_AOSP := true
BOARD_QTI_CAMERA_32BIT_ONLY := false
CAMERA_DAEMON_NOT_PRESENT := true
TARGET_USES_ION := true
TARGET_USES_EASEL := true
BOARD_USES_EASEL := true

# GPS
TARGET_NO_RPC := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# RenderScript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Sensors
USE_SENSOR_MULTI_HAL := true
TARGET_SUPPORT_DIRECT_REPORT := true
# Enable sensor Version V_2
USE_SENSOR_HAL_VER := 2.0

# CHRE
CHRE_DAEMON_ENABLED := true
CHRE_DAEMON_LOAD_INTO_SENSORSPD := true

# wlan
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_DRIVER_DEFAULT := qca_cld3
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE:= true
WIFI_FEATURE_WIFI_EXT_HAL := true
WIFI_FEATURE_IMU_DETECTION := false
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
AUDIO_FEATURE_ENABLED_USB_TUNNEL := true
AUDIO_FEATURE_ENABLED_CIRRUS_SPKR_PROTECTION := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
AUDIO_FEATURE_FLICKER_SENSOR_INPUT := true
SOUND_TRIGGER_FEATURE_LPMA_ENABLED := true
AUDIO_FEATURE_ENABLED_MAXX_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER_5514 := true
AUDIO_FEATURE_ENABLED_24BITS_CAMCORDER := true

# Graphics
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_NV21_CAMERA_PREVIEW := true

VSYNC_EVENT_PHASE_OFFSET_NS := 2000000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 6000000

# Display
TARGET_HAS_WIDE_COLOR_DISPLAY := true
TARGET_HAS_HDR_DISPLAY := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_COLOR_METADATA := true
TARGET_USES_DRM_PP := true

# Vendor Interface Manifest
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/hidl/manifest.xml
DEVICE_MATRIX_FILE := $(LOCAL_PATH)/hidl/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(LOCAL_PATH)/hidl/device_framework_matrix.xml

# Userdebug only Vendor Interface Manifest
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
	DEVICE_FRAMEWORK_MANIFEST_FILE += $(LOCAL_PATH)/hidl/framework_manifest_userdebug.xml
	DEVICE_MATRIX_FILE += $(LOCAL_PATH)/hidl/compatibility_matrix_userdebug.xml
endif

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

#-include vendor/motorola/astro/proprietary/BoardConfigVendor.mk
