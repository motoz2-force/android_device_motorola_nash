ifeq ($(AB_OTA_UPDATER),true)

# Preset TARGET_USES_HARDWARE_QCOM_BOOTCTRL for existing platforms.
ifneq ($(filter msm8953 msm8996 msm8998 sdm660 sdm845 sdm710,$(TARGET_BOARD_PLATFORM)),)
TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true
endif

ifeq ($(strip $(TARGET_USES_HARDWARE_QCOM_BOOTCTRL)),true)
# TODO:  Find a better way to separate build configs for ADP vs non-ADP devices
ifneq ($(BOARD_IS_AUTOMOTIVE),true)
LOCAL_PATH := $(call my-dir)

# HAL Shared library for the target. Used by libhardware.
include $(CLEAR_VARS)
LOCAL_CFLAGS += -Wall -Werror
LOCAL_SHARED_LIBRARIES += liblog libgptutils libcutils
LOCAL_HEADER_LIBRARIES := libhardware_headers libsystem_headers
LOCAL_SRC_FILES := boot_control.cpp
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := bootctrl.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_OWNER := qcom
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# Static library for the target. Used by update_engine_sideload from recovery.
include $(CLEAR_VARS)
LOCAL_CFLAGS += -Wall -Werror
LOCAL_SHARED_LIBRARIES += liblog libgptutils libcutils
LOCAL_HEADER_LIBRARIES := libhardware_headers libsystem_headers
LOCAL_SRC_FILES := boot_control.cpp
LOCAL_MODULE := bootctrl.$(TARGET_BOARD_PLATFORM)
include $(BUILD_STATIC_LIBRARY)

endif
endif
endif
