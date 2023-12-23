#!/bin/bash
set -e
# Rebuild and run the app on simulator quickly

# SET_ENABLE_BUILD_CACHE
export IS_POD_BINARY_CACHE_ENABLED='true'

# IS_FORCE
IS_FORCE=${IS_FORCE:=true}

# convert value to lowercase
lowercase() {
    echo $1 | tr [:upper:] [:lower:]
}

# Create a cache repo branch for each environment
BRANCH="main"

# START_DATE for build
START_DATE=$(date +%s)

# Fetch from cache repo
# bundle exec pod binary fetch $BRANCH

# Prebuild binary pods
if [[ "${IS_FORCE}" == 'true' ]]; then
    # Prebuild all binary pods regardless of cache validation
    bundle exec pod binary prebuild $BRANCH --all
else
    echo "IS_FORCE = ${IS_FORCE}"
    bundle exec pod binary prebuild $BRANCH
fi

# Push the prebuilt pods to the cache repo
bundle exec pod binary push $BRANCH

# END_DATE to calculate duration in secondary
END_DATE=$(date +%s)
DURATION_BUILD=$(($END_DATE - $START_DATE))
echo ">>> Duration build: $DURATION_BUILD seconds"

# Reset side-effect caching
export IS_POD_BINARY_CACHE_ENABLED=''