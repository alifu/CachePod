# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def is_pod_binary_cache_enabled
  ENV['IS_POD_BINARY_CACHE_ENABLED'] == 'true'
end

if is_pod_binary_cache_enabled
  plugin 'cocoapods-binary-cache'
  config_cocoapods_binary_cache(
    cache_repo: {
      "default" => {
        "remote" => "git@github.com:alifu/CachePodBinary.git",
        "local" => "cocoapods-binary-cache"
      }
    },
    xcframework: true,
    device_build_enabled: true,
    bitcode_enabled: true
  )
end

def binary_pod(name, *args)
  if is_pod_binary_cache_enabled
    pod name, args, :binary => true
  else
    pod name, args
  end
end

target 'CachePod' do

  # Pods for CachePod
  binary_pod "AFNetworking"
  binary_pod "SDWebImage"
  binary_pod "Alamofire"
  binary_pod "MBProgressHUD"
  binary_pod "Masonry"
  binary_pod "SwiftyJSON"
  binary_pod "SVProgressHUD"
  binary_pod "MJRefresh"
  binary_pod "CocoaLumberjack"
  binary_pod "Realm"
  binary_pod "SnapKit"
  binary_pod "Kingfisher"
  binary_pod "RxSwift"
  binary_pod "RxCocoa"

end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
