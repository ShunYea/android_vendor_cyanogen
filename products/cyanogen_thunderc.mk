# Include the stock APNS config file instead of the dev one
PRODUCT_COPY_FILES := \
    device/lge/thunderc/files/etc/apns-conf.xml:system/etc/apns-conf.xml \
    $(PRODUCT_COPY_FILES)

# Inherit device configuration for the thunderc.
$(call inherit-product, device/lge/thunderc/thunderc.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include FM-Radio stuff (does not work at this moment)
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LG-$(SUB_MODEL)
PRODUCT_MANUFACTURER := LGE
PRODUCT_NAME := cyanogen_thunderc_$(SUB_MODEL)
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0 BUILD_DISPLAY_ID=$(shell date +%m%d%Y) BUILD_ID=GRJ90 BUILD_FINGERPRINT=google/sojus/crespo4g:2.3.5/GRJ90/138666:user/release-keys PRIVATE_BUILD_DESC="sojus-user 2.3.5 GRJ90 138666 release-keys" BUILD_NUMBER=138666 PRODUCT_DEVICE=LG-LW690

# Live wallpaper packages
PRODUCT_PACKAGES += \
        LiveWallpapersPicker \

#CYANOGEN_NIGHTLY := true

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7.2-$(shell date +%m%d%Y)-NIGHTLY
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.2.0-
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.2-$(PRODUCT_MODEL)-$(shell date +%m%d%Y)
    endif
endif

