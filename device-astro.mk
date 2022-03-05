#
# Copyright 2016 The Android Open Source Project
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

PRODUCT_HARDWARE := astro

LOCAL_PATH := device/motorola/astro

include $(LOCAL_PATH)/device-common.mk

# TODO: PREPARE OVERLAY
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/$(PRODUCT_HARDWARE)/overlay

# Vibrator HAL
PRODUCT_PRODUCT_PROPERTIES +=\
    ro.vibrator.hal.config.dynamic=1 \
    ro.vibrator.hal.click.duration=8 \
    ro.vibrator.hal.tick.duration=5 \
    ro.vibrator.hal.heavyclick.duration=12 \
    ro.vibrator.hal.short.voltage=120 \
    ro.vibrator.hal.long.voltage=90 \
    ro.vibrator.hal.long.frequency.shift=10 \
    ro.vibrator.hal.double_click.duration=182