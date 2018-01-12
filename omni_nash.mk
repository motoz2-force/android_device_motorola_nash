#
# Copyright 2012 The Android Open Source Project
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

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit language packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_PACKAGES += \
    charger_res_images \
    charger \
    update_engine_sideload

# Time Zone data for recovery
PRODUCT_COPY_FILES += \
    bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

PRODUCT_DEVICE := nash
PRODUCT_NAME := omni_nash
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto Z (2)
PRODUCT_MANUFACTURER := motorola
