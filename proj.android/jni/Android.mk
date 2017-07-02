LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
   
LOCAL_MODULE    := libprotobuf
LOCAL_SRC_FILES := prebuilt/$(TARGET_ARCH_ABI)/libprotobuf.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

$(call import-add-path,$(LOCAL_PATH)/../../cocos2d)
$(call import-add-path,$(LOCAL_PATH)/../../cocos2d/external)
$(call import-add-path,$(LOCAL_PATH)/../../cocos2d/cocos)
$(call import-add-path,$(LOCAL_PATH)/../../cocos2d/cocos/audio/include)

LOCAL_MODULE := MyGame_shared

LOCAL_MODULE_FILENAME := libMyGame
LOCAL_LDFLAGS := -Wl,--allow-multiple-definition
LOCAL_SHARED_LIBRARIES := libprotobuf
LOCAL_CPP_FEATURES := rtti

LOCAL_SRC_FILES := hellocpp/main.cpp \
                   ../../Classes/AppDelegate.cpp \
                   ../../Classes/HelloWorldScene.cpp \
				   ../../Classes/AdvancedUnit.cpp \
				   ../../Classes/AppDelegate.cpp \
				   ../../Classes/BattleScene.cpp \
				   ../../Classes/Buliding.cpp \
				   ../../Classes/GameMessage.pb.cc \
				   ../../Classes/GridMap.cpp \
				   ../../Classes/HelloWorldScene.cpp \
				   ../../Classes/SocketClient.cpp \
				   ../../Classes/SocketServer.cpp \
				   ../../Classes/Unit.cpp \
				   ../../Classes/PathFinder/PathFinder.cpp \

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes
LOCAL_C_INCLUDES += $(shell ls -FR $(LOCAL_C_INCLUDES) | grep $(LOCAL_PATH)/$ )
LOCAL_C_INCLUDES := $(LOCAL_C_INCLUDES:$(LOCAL_PATH)/%:=$(LOCAL_PATH)/%)

# _COCOS_HEADER_ANDROID_BEGIN
# _COCOS_HEADER_ANDROID_END


LOCAL_STATIC_LIBRARIES := cocos2dx_static

# _COCOS_LIB_ANDROID_BEGIN
# _COCOS_LIB_ANDROID_END

include $(BUILD_SHARED_LIBRARY)

$(call import-module,.)

# _COCOS_LIB_IMPORT_ANDROID_BEGIN
# _COCOS_LIB_IMPORT_ANDROID_END
