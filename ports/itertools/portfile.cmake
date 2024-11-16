set(VCPKG_POLICY_ALLOW_DEBUG_INCLUDE enabled)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO parcollet/itertools
        REF eef9fdb
        SHA512 114ed2ef9357b6c9eb9d76f89b32f9780e4a48d6ca0f89398624e59b5429137abf5d6a5808f34af56b337ce41dfbd32acf0208d2d28bb3fb0a7d5746240b3f0e
        HEAD_REF unstable
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
	OPTIONS -DDO_NOT_USE_DEPS=ON
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
        INSTALL "${SOURCE_PATH}/LICENSE.txt"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)

