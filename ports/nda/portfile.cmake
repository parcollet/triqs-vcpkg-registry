vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO triqs/nda
        REF 1.2.0
        SHA512 a5b3a849b9b30124208e631afae0786b8a50630e51b1773a854ba4151833fd9081f722513ab0a6fe772d472235d9c3e0d9ee0686a482395adb20cdf920b4e067
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

