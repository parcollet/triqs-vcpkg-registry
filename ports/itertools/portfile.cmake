vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO triqs/itertools
        REF 1.2.0
        SHA512 4138024408408fadb605dd55cbd05864aa0584a7de2b21cb0e39a2b9abf555c173079ae242c86db1a2a83d4b8702c31c58c63cbccf6c9630317af799555c0a15
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

