#!/bin/bash
set -e
# Rebuild and run the app on simulator quickly

echo ">>>>> Check to sync your cocoapods"
# Install dependency frameworks
pod_install() {
    START_DATE=$(date +%s)
    bundle exec pod install
    END_DATE=$(date +%s)
    DURATION_BUILD=$(($END_DATE - $START_DATE))
    echo ">>> Duration [cocoapods setup]: $DURATION_BUILD seconds"
}

# Setup environment variables
ENV=${ENV:=Dev}
ENABLE_CACHE=${ENABLE_CACHE:=true}
export IS_POD_BINARY_CACHE_ENABLED="${ENABLE_CACHE}"

PODS_PODFILE_PATH="./Podfile.lock"
PODS_ROOT="./Pods"
if [[ "${ENABLE_CACHE}" == 'true' ]]; then
    readonly pods_root_prebuild="./_Prebuild"
    readonly cache_local_path="cocoapods-binary-cache"
    # Check to fetch cache repo to cache local if the cache local does not exit
    if [[ (! -f "${pods_root_prebuild}/Manifest.lock") || (! -d "${cache_local_path}") ]]; then
        ENV=$ENV .tools/scripts/pod-fetch-cache.sh
    fi
fi

# Check to run pod install if the podfile does not exit
if [ ! -f "${PODS_PODFILE_PATH}" ]; then
    pod_install
    exit 0
fi

# Check to run pod install if the podfile is outdated
if diff "${PODS_PODFILE_PATH}" "${PODS_ROOT}/Manifest.lock" > /dev/null ; then
    echo "The Podfile's dependencies are satisfied"
else
    pod_install
fi