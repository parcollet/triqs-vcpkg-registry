git ci -m "port "
~/vcpkg/vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose --overwrite-version 
git add versions ports
git ci -m "update port and version"
git push
git rev-parse HEAD
pushd ~/vcpkg
./vcpkg x-update-baseline
popd

