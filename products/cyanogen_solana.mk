# Inherit device configuration for Droid3.
$(call inherit-product, device/motorola/solana/device_solana.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
#$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_solana
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := solana
PRODUCT_MODEL := DROID3
PRODUCT_MANUFACTURER := motorola
PRODUCT_BUILD_PROP_OVERRIDES += \
   PRODUCT_NAME=solana_vzw \
   BUILD_ID=5.5.1_84_D3G-55 \
   BUILD_DISPLAY_ID=5.5.1_84_D3G-55 \
   BUILD_FINGERPRINT=verizon/solana_vzw/cdma_solana:2.3.7/5.5.1_84_D3G-55/110812:user/release-keys \
   PRIVATE_BUILD_DESC="cdma_solana-user 2.3.7 5.5.1_84_D3G-55 110812 release-keys" \
   TARGET_DEVICE=cdma_solana \
   PRODUCT_BRAND=verizon \
   BUILD_UTC_DATE= \
   BUILD_NUMBER=110812 \
   TARGET_BUILD_TYPE=user \
   BUILD_VERSION_TAGS=release-keys \
   USER=hashcode \
   BUILD_HOST=hashcode-unn \
   PRODUCT_DEFAULT_LANGUAGE=en \
   PRODUCT_DEFAULT_REGION=US \

# Extra Droid3 overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/solana

# Broadcom FM radio
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-SOLANA-SELFKANG
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-SOLANA
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-SOLANA-SELFKANG
    endif
endif

#
# Copy Droid3 specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
