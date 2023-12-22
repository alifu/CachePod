# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'CachePod' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CachePod
  pod "AFNetworking"
  pod "SDWebImage"
  pod "Alamofire"
  pod "MBProgressHUD"
  pod "Masonry"
  pod "SwiftyJSON"
  pod "SVProgressHUD"
  pod "MJRefresh"
  pod "CocoaLumberjack"
  pod "Realm"
  pod "SnapKit"
  pod "Kingfisher"

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
