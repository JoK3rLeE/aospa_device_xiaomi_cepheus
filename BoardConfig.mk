#
# Copyright (C) 2020 The LineageOS Project
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

BOARD_VENDOR := xiaomi

DEVICE_PATH := device/xiaomi/cepheus

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_NETWORK := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Inherit from proprietary files
include vendor/xiaomi/cepheus/BoardConfigVendor.mk

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a76

# Assert
TARGET_OTA_ASSERT_DEVICE := cepheus

# Audio
AUDIO_FEATURE_ENABLED_CON_THREAD := true
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true

USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include
TARGET_FWK_SUPPORTS_FULL_VALUEADDS := true
TARGET_USE_QTI_BT_STACK := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := cepheus
TARGET_NO_BOOTLOADER := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Display
TARGET_HAS_HDR_DISPLAY := true
TARGET_HAS_WIDE_COLOR_DISPLAY := true
TARGET_USES_COLOR_METADATA := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_DRM_PP := true
TARGET_USES_GRALLOC4 := true
TARGET_USES_HWC2 := true

# Graphics
BOARD_USES_ADRENO := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/config.fs

# FOD
TARGET_SURFACEFLINGER_UDFPS_LIB := //$(DEVICE_PATH):libudfps_extension.cepheus
TARGET_USES_FOD_ZPOS := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
LOC_HIDL_VERSION := 4.0

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/hidl/manifest.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/c2_manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/hidl/compatibility_matrix.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_cepheus
TARGET_RECOVERY_DEVICE_MODULES := libinit_cepheus

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000

TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := cepheus_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/cepheus
TARGET_KERNEL_CLANG_VERSION := azure
KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-azure/bin
KERNEL_SUPPORTS_LLD := true
KERNEL_SUPPORTS_LLVM_TOOLS := true

BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xa90000
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_CMDLINE += kpti=off
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/1d84000.ufshc

# Media
TARGET_USES_ION := true
TARGET_DISABLED_UBWC := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_DTBOIMG_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57453555712
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
# BOARD_VENDORIMAGE_PARTITION_SIZE := 1610612736
BOARD_SUPER_PARTITION_GROUPS := cepheus_dynamic_partitions
BOARD_CEPHEUS_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor
BOARD_SUPER_PARTITION_SIZE := 5368709120
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_BLOCK_DEVICES := system vendor
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3758096384
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 1610612736
BOARD_CEPHEUS_DYNAMIC_PARTITIONS_SIZE := 5364514816 # BOARD_SUPER_PARTITION_SIZE - 4MB

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_METADATA_PARTITION := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_VENDOR := vendor

# Platform
TARGET_BOARD_PLATFORM := msmnile

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# QCOM
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-10-01

# Sepolicy
TARGET_SEPOLICY_DIR := msmnile
include device/qcom/sepolicy_vndr/SEPolicy.mk

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# USB
TARGET_QTI_USB_SUPPORTS_AUDIO_ACCESSORY := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
