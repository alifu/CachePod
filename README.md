# Cache Pod

To shorten the build process for projects that use `Cocoapod`, we can use a plugin called [cocoapod-binary-cache](https://github.com/grab/cocoapods-binary-cache.git). The configuration can be read [here](https://github.com/grab/cocoapods-binary-cache/blob/master/docs/configure_cocoapods_binary_cache.md). How this Plugin works, read [here](https://github.com/grab/cocoapods-binary-cache/blob/master/docs/how_it_works.md)

## Setup

The project has some scripts available to shorten the project initialization process.

### Pod Check
Please run the following command to perform `pod install` and initialize `cache`

```bash
$ ./.tools/scripts/pod-check.sh
```

### Pod Fetch Cache
To fetch if there are updates in the `remote cache`, run the command:

```bash
$ ./.tools/scripts/pod-fetch-cache.sh
```

### Pod Update Cache
Finally, to perform a cache update if there are new `pod`s or deleted `pod`s, run the command:

```bash
$ ./.tools/scripts/pod-update-cache.sh
```