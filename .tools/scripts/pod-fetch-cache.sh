#!/bin/bash
set -e
# Rebuild and run the app on simulator quickly

echo ">>>>> Check to fetch cache repo to cache local"
# SET_ENABLE_BUILD_CACHE
export IS_POD_BINARY_CACHE_ENABLED='true'

# convert value to lowercase
lowercase() {
    echo $1 | tr [:upper:] [:lower:]
}

# Create a cache repo branch for each environment
BRANCH="main"

# START_DATE for build
START_DATE=$(date +%s)

# Check to fetch from cache repo if the Manifest is outdated
PODS_PODFILE_PATH="./Podfile.lock"
PODS_LOCAL_MANIFEST="./cocoapods-binary-cache/Manifest.lock"
if diff "${PODS_PODFILE_PATH}" "${PODS_LOCAL_MANIFEST}" > /dev/null ; then
    echo "Your dependency frameworks are up to date"
else
    # Pass prompt option with yes command and answer [N]one to skip uneccessary override
    yes N | bundle exec pod binary fetch $BRANCH
fi

# END_DATE to calculate duration in secondary
END_DATE=$(date +%s)
DURATION_BUILD=$(($END_DATE - $START_DATE))
echo ">>> Duration build: $DURATION_BUILD seconds"

# Reset side-effect caching
export IS_POD_BINARY_CACHE_ENABLED=''