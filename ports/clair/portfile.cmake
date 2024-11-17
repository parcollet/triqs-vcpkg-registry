set(VCPKG_POLICY_ALLOW_DEBUG_INCLUDE enabled)
set(VCPKG_POLICY_ALLOW_DEBUG_SHARE enabled)
set(VCPKG_POLICY_SKIP_MISPLACED_CMAKE_FILES_CHECK enabled)
set(VCPKG_POLICY_SKIP_LIB_CMAKE_MERGE_CHECK enabled)
set(VCPKG_POLICY_SKIP_ABSOLUTE_PATHS_CHECK enabled)

#include("${CMAKE_CURRENT_LIST_DIR}/../_common.cmake")

# curl -L https://github.com/flatironinstitute/clair/archive/669664c14f445b9b82ab70c2dacb1bc18757c0c7.tar.gz -o tmp && vcpkg hash tmp && rm tmp
# curl -L https://github.com/parcollet/clair/archive/126361aac6efb76e45b7d1663a5af1bceb5a66e6.tar.gz -o tmp && vcpkg hash tmp && rm tmp
# Should write a function that computes the SHA for debug purpose ? 
# https://github.com/${REPO}/archive/${REF}.tar.gz

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO parcollet/clair
        REF 126361aac6efb76e45b7d1663a5af1bceb5a66e6
        SHA512 62304aba3cf0c442dfbffa8f5c9f6fee811ecb8e0074ae29721f99d264d62471eccfe672d253e8fdf7de24ba71b64686c89ca13918167c17f342904d37b9a799
        HEAD_REF unstable
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
	GENERATOR "Unix Makefiles"
	OPTIONS	
	-DBuild_Tests=OFF
	-DDO_NOT_USE_DEPS=ON
	
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup()
vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs() # ??

#file(REMOVE_RECURSE
#    "${CURRENT_PACKAGES_DIR}/debug/include"
#    "${CURRENT_PACKAGES_DIR}/debug/share"
#)

#file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
#vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")


file(INSTALL "${SOURCE_PATH}/LICENSE.txt"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright
)

       
