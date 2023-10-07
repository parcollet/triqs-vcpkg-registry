vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO parcollet/itertools
        REF f3f8f8a
        SHA512 5958e88df9ea49dfb7d135fb7da6da683253ceda84d1de9fa39a8ef249d31893ff01485c2a771d3f18bdec8fcda8c5ffb28646aed30b07d700b51df8efa94726
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

