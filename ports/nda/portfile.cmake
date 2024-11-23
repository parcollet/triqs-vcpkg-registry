set(VCPKG_POLICY_ALLOW_DEBUG_INCLUDE enabled)
set(VCPKG_POLICY_ALLOW_DEBUG_SHARE enabled)
set(VCPKG_POLICY_SKIP_MISPLACED_CMAKE_FILES_CHECK enabled)
set(VCPKG_POLICY_SKIP_LIB_CMAKE_MERGE_CHECK enabled)
set(VCPKG_POLICY_SKIP_ABSOLUTE_PATHS_CHECK enabled)

#include("${CMAKE_CURRENT_LIST_DIR}/../_common.cmake")

# curl -L https://github.com/flatironinstitute/c2py/archive/aa1cd746204d3d1c748b733eb8daa1d2dab0163c.tar.gz -o tmp && vcpkg hash tmp
# Should write a function that computes the SHA for debug purpose ? 
# https://github.com/${REPO}/archive/${REF}.tar.gz

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO parcollet/nda1
        REF vcpkg
        SHA512 0
        HEAD_REF vcpkg
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
	GENERATOR "Unix Makefiles"
	OPTIONS	
	-DBuild_Tests=OFF
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

       
