git ci -m "port "
~/vcpkg/vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose --overwrite-version 
git ci -m"version"
git push
git rev-parse HEAD

