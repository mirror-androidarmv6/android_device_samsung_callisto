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

## Note: this file and all of its includes are parsed before any
## BoardConfig files. 3.0 Kernel & ath6kl configuration must be set here.

## Build the 3.0.x Kernel
#BUILD_WITH_30X_KERNEL := true

## Build the ath6kl-compat driver
BOARD_WLAN_DEVICE := ath6kl_compat

## Keymap (rename sec_key to sec_keypad)
PRODUCT_COPY_FILES += \
    device/samsung/msm7x27-common/prebuilt/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_keypad.kl

## Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/callisto/ramdisk/CALLISTO.rle:root/CALLISTO.rle

# Inherit products (Most specific first)
# callisto blobs > samsung common(device/vendor) > other blobs
$(call inherit-product, vendor/samsung/callisto/vendor_blobs.mk)
$(call inherit-product, device/samsung/msm7x27-common/common.mk)
$(call inherit-product, vendor/samsung/msm7x27-common/vendor.mk)

## LDPI assets
PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi
$(call inherit-product, device/ldpi-common/ldpi.mk)

## Inherit overlays  (Most specific last)
DEVICE_PACKAGE_OVERLAYS += device/samsung/callisto/overlay
