#source 'https://github.com/CocoaPods/Specs.git'
project 'desafio-carrefour.xcodeproj'
# Pods project - minimum deployment target
platform :ios, '13.0'
use_frameworks!

target 'desafio-carrefour' do
  pod 'Alamofire', '~> 5.8'
  pod 'ObjectMapper', '~> 4.2'
  pod 'SDWebImage', '5.12.0'
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
