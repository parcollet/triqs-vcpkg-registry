#set(VCPKG_POLICY_ALLOW_DEBUG_INCLUDE enabled)
set(VCPKG_POLICY_ALLOW_DEBUG_SHARE enabled)
set(VCPKG_POLICY_SKIP_MISPLACED_CMAKE_FILES_CHECK enabled)
set(VCPKG_POLICY_SKIP_LIB_CMAKE_MERGE_CHECK enabled)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO parcollet/itertools
        REF 77be9d50c713a8434e6fa8ca8edcc76885dfd463
        SHA512 27ae01fdda885f582e60b2aaec62c690b6fccfd20c7c3bd7f9654705a64898d1728b56b2d563b2f93ac179df2dd45c63fe0834deaf0c3f5138410bce45f09e07
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

       
