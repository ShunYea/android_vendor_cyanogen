 
# Inherit AOSP device configuration for m865.
$(call inherit-product, device/huawei/ascend2/ascend2.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_ascend2
PRODUCT_BRAND := Huawei
PRODUCT_DEVICE := ascend2
PRODUCT_MODEL := M865
PRODUCT_MANUFACTURER := Huawei
PRODUCT_BOARD := M865
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C8650 BUILD_ID=GINGERBREAD BUILD_DISPLAY_ID=CM7A2-$(shell date +%m%d%Y) BUILD_FINGERPRINT=Huawei/C8650/hwC8650:2.3.7/HuaweiC8650/ShunYea:user/ota-rel-keys,release-keys PRODUCT_DEVICE=hwC8650


#
# Set ro.modversion
#

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CM7.2-M865-Nightly$(shell date +%m%d%Y)
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CM-7.2RC-M865
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CM7.2-M865-$(shell date +%m%d%Y)
    endif
endif

#
# Copy legend specific prebuilt files
#
# Bootanimation
PRODUCT_COPY_FILES += \
    device/huawei/ascend2/include/media/bootanimation.zip:system/media/bootanimation.zip
