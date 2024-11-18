set(VCPKG_POLICY_ALLOW_DEBUG_INCLUDE enabled)
set(VCPKG_POLICY_ALLOW_DEBUG_SHARE enabled)
set(VCPKG_POLICY_SKIP_MISPLACED_CMAKE_FILES_CHECK enabled)
set(VCPKG_POLICY_SKIP_LIB_CMAKE_MERGE_CHECK enabled)
set(VCPKG_POLICY_SKIP_ABSOLUTE_PATHS_CHECK enabled)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

#include("${CMAKE_CURRENT_LIST_DIR}/../_common.cmake")

# curl -L https://github.com/flatironinstitute/clair/archive/669664c14f445b9b82ab70c2dacb1bc18757c0c7.tar.gz -o tmp && vcpkg hash tmp && rm tmp
# curl -L https://github.com/parcollet/clair/archive/4f07761aa39170d068738438b01f5480e844b093.tar.gz -o tmp && vcpkg hash tmp && rm tmp
# Should write a function that computes the SHA for debug purpose ? 
# https://github.com/${REPO}/archive/${REF}.tar.gz

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO parcollet/clair
        REF 4f07761aa39170d068738438b01f5480e844b093
        SHA512 b8a3b1c0cf740bfe3b2370e416a0f1b790b2089c476f77eaaba5da282c04b4073978298bac831fd533e8dd47e7a4990409cc3a725a3a7b71808e0a8100e6c72e
        HEAD_REF unstable
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
	#GENERATOR "Unix Makefiles"
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

       
