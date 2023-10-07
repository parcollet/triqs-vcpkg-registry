vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO triqs/nda
        REF 1.2.0
        SHA512 0
        HEAD_REF unstable
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
        PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
        INSTALL "${SOURCE_PATH}/LICENSE.txt"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)

