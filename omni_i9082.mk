# Get non-open-source parts
$(call inherit-product, vendor/samsung/i9082/i9082-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Boot animation
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.capri:root/fstab.capri \
    $(LOCAL_PATH)/rootdir/init.capri.rc:root/init.capri.rc \
    $(LOCAL_PATH)/rootdir/init.bcm281x5.usb.rc:root/init.bcm281x5.usb.rc \
    $(LOCAL_PATH)/rootdir/init.log.rc:root/init.log.rc \
    $(LOCAL_PATH)/rootdir/init.recovery.capri.rc:root/init.recovery.capri.rc \
    $(LOCAL_PATH)/rootdir/ueventd.capri.rc:root/ueventd.capri.rc \
    $(LOCAL_PATH)/rootdir/rild.rc:system/etc/init/rild.rc

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayouts/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
    $(LOCAL_PATH)/keylayouts/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
    $(LOCAL_PATH)/keylayouts/cyttsp4_btn.kl:system/usr/keylayout/cyttsp4_btn.kl \
    $(LOCAL_PATH)/keylayouts/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayouts/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
    $(LOCAL_PATH)/keylayouts/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl

# Packages
PRODUCT_PACKAGES += \
    charger_res_images \
    SamsungDoze \
    SamsungServiceMode

# Wi-Fi
PRODUCT_PACKAGES += \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

$(call inherit-product, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

# Stlport
PRODUCT_PACKAGES += \
    libstlport

# GPS
PRODUCT_PACKAGES += \
    libglgps-compat

# Audio modules
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

USE_CUSTOM_AUDIO_POLICY := 1

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# System properties
$(call inherit-product, $(LOCAL_PATH)/system_prop.mk)

# Dalvik heap config
#$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=64m \
    dalvik.vm.heapsize=174m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=2m \
    dalvik.vm.extra-opts=-XX:+DisableExplicitGC
