TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = Kleinanzeigen


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = KleinanzeigenShareURLonly

KleinanzeigenShareURLonly_FILES = Tweak.x
KleinanzeigenShareURLonly_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

# https://github.com/theos/theos/issues/481
SHELL = /usr/bin/bash
