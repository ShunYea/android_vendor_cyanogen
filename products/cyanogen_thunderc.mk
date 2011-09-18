# Include the stock APNS config file instead of the dev one
PRODUCT_COPY_FILES := \
    device/lge/thunderc/files/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/lge/thunderc/files/media/bootanimation.zip:system/media/bootanimation.zip \
    device/lge/thunderc/files/media/somebodys.ogg:system/media/audio/ringtones/somebodys.ogg \
    $(PRODUCT_COPY_FILES)

# Inherit device configuration for the thunderc.
$(call inherit-product, device/lge/thunderc/thunderc.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include FM-Radio stuff (does not work at this moment)
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderc
PRODUCT_MODEL := LG-$(SUB_MODEL)
PRODUCT_MANUFACTURER := LGE
PRODUCT_NAME := cyanogen_thunderc_$(SUB_MODEL)
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=thunderc BUILD_UTC_DATE=0 BUILD_ID=GRJ90-LG-$(SUB_MODEL) BUILD_DISPLAY_ID="GRJ90 ($(shell date +%m%d%Y)/LG-$(SUB_MODEL))" BUILD_FINGERPRINT=lge/thunderg/thunderg:2.3.5/GRJ90/LG-$(SUB_MODEL)/release-keys PRIVATE_BUILD_DESC="thunderc-user 2.3.5 GRJ90 LG-$(SUB_MODEL) release-keys"

# Live wallpaper packages
PRODUCT_PACKAGES += \
        LiveWallpapersPicker \

#CYANOGEN_NIGHTLY := true

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7.2-$(PRODUCT_MODEL)-$(shell date +%m%d%Y)-NIGHTLY
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.2
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.2-$(PRODUCT_MODEL)-$(shell date +%m%d%Y)
    endif
endif

