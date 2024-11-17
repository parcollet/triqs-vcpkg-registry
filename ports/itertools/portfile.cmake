#set(VCPKG_POLICY_ALLOW_DEBUG_INCLUDE enabled)
set(VCPKG_POLICY_ALLOW_DEBUG_SHARE enabled)
set(VCPKG_POLICY_SKIP_MISPLACED_CMAKE_FILES_CHECK enabled)
set(VCPKG_POLICY_SKIP_LIB_CMAKE_MERGE_CHECK enabled)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO parcollet/itertools
        REF 1.2.x
        SHA512 c8a6b45fa51a1ddb44de54edaad956b8adffe1c5326356852032dc19c0fde3f96ee20464be7544b6a586d7305d082e8841444172e5e453c1a75053f36b3d91ea
        HEAD_REF unstable
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
	GENERATOR "Unix Makefiles"
	OPTIONS	
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

#file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE.txt"
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright
)

       
