git add versions ports
git ci -m "update ports "
~/vcpkg/vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose --overwrite-version 
git commit --all --amend 
git push
git rev-parse HEAD
pushd ~/vcpkg
./vcpkg x-update-baseline
popd

