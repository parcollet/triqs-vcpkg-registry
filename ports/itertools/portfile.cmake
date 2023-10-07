vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO parcollet/itertools
        REF 95bae02
        SHA512 92b6a2322a4da284f8d6e5ad86a38ed94cf7fa817ccebe83b62fb3198d3dc0d9684bb4a38120a87a9062a889f26db6d323066dbfa5b2daaac5380b5b0c2bb63a
        HEAD_REF unstable
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
	OPTIONS -DDO_NOT_USE_DEPS=ON
        PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
        INSTALL "${SOURCE_PATH}/LICENSE.txt"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)

