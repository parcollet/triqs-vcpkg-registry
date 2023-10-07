vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO parcollet/itertools
        REF 111fd22
        SHA512 95ca8ed79f142bd07919e0821e0325feedc4cdf51c53835ac970efa2d54a74d15180034ab35efa3d236fdb44d3dd9a3131c0b8cc40b45f020d87e3382e47e9f6
        HEAD_REF unstable
)

vcpkg_configure_cmake(
        SOURCE_PATH "${SOURCE_PATH}"
	OPTIONS -DDO_NOT_USE_DEPS
        PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
        INSTALL "${SOURCE_PATH}/LICENSE.txt"
        DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
        RENAME copyright)

