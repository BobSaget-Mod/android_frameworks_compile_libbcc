#
# Copyright (C) 2010-2012 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

# Executable for host
# ========================================================
include $(CLEAR_VARS)

LOCAL_MODULE := bcc
LOCAL_MODULE_TAGS := tests eng
LOCAL_MODULE_CLASS := EXECUTABLES

# The definition of those functions in libLLVMSupport may elude libbcc due to linker.
# Should include libLLVMSupport since bcc references some functions within it.
LOCAL_STATIC_LIBRARIES := libLLVMSupport
LOCAL_SHARED_LIBRARIES := libbcc
LOCAL_LDLIBS = -ldl
LOCAL_SRC_FILES := main.cpp

include $(LIBBCC_HOST_BUILD_MK)
include $(BUILD_HOST_EXECUTABLE)

# Executable for target
# ========================================================
include $(CLEAR_VARS)

LOCAL_MODULE := bcc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_SRC_FILES := main.cpp

LOCAL_SHARED_LIBRARIES := libdl libstlport libbcinfo libbcc

include external/stlport/libstlport.mk
include $(LIBBCC_DEVICE_BUILD_MK)
include $(BUILD_EXECUTABLE)
