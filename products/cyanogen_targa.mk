# Inherit device configuration for Bionic.
$(call inherit-product, device/motorola/targa/device_targa.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
#$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_targa
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := targa
PRODUCT_MODEL := BIONIC
PRODUCT_MANUFACTURER := motorola
PRODUCT_BUILD_PROP_OVERRIDES += \
   PRODUCT_NAME=targa_vzw \
   BUILD_ID=5.5.1_84_DBN-65 \
   BUILD_DISPLAY_ID=5.5.1_84_DBN-65 \
   BUILD_FINGERPRINT=verizon/targa_vzw/cdma_targa:2.3.7/5.5.1_84_DBN-65/110812:user/release-keys \
   PRIVATE_BUILD_DESC="cdma_targa-user 2.3.7 5.5.1_84_DBN-65 110812 release-keys" \
   TARGET_DEVICE=cdma_targa \
   PRODUCT_BRAND=verizon \
   BUILD_UTC_DATE= \
   BUILD_NUMBER=110812 \
   TARGET_BUILD_TYPE=user \
   BUILD_VERSION_TAGS=release-keys \
   USER=xrev \
   BUILD_HOST=xrev-mach \
   PRODUCT_DEFAULT_LANGUAGE=en \
   PRODUCT_DEFAULT_REGION=US \

# Extra Bionic overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/targa

# Broadcom FM radio
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-TARGA-SELFKANG
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-TARGA
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-TARGA-SELFKANG
    endif
endif

#
# Copy Bionic specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
