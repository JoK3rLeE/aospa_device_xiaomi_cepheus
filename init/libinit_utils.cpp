/*
   Copyright (C) 2020 The LineageOS Project.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#include <libinit_utils.h>

#define FIND_AND_REMOVE(s, delimiter, variable_name) \
    std::string variable_name = s.substr(0, s.find(delimiter)); \
    s.erase(0, s.find(delimiter) + delimiter.length());

const std::string fingerprint_to_description(const std::string &fingerprint) {
    const std::string delimiter = "/";
    const std::string delimiter2 = ":";

    std::string build_fingerprint_copy = fingerprint;

    FIND_AND_REMOVE(build_fingerprint_copy, delimiter, brand)
    FIND_AND_REMOVE(build_fingerprint_copy, delimiter, product)
    FIND_AND_REMOVE(build_fingerprint_copy, delimiter2, device)
    FIND_AND_REMOVE(build_fingerprint_copy, delimiter, platform_version)
    FIND_AND_REMOVE(build_fingerprint_copy, delimiter, build_id)
    FIND_AND_REMOVE(build_fingerprint_copy, delimiter2, build_number)
    FIND_AND_REMOVE(build_fingerprint_copy, delimiter, build_variant)
    std::string build_version_tags = build_fingerprint_copy;

    const std::string description = product + "-" + build_variant + " " + platform_version +
            " " + build_id + " " + build_number + " " + build_version_tags;

    return description;

    // SafetyNet workaround
    property_override("ro.boot.verifiedbootstate", "green");
}
