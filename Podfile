# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'swipeApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Koloda'
  pod 'TinderSwipeView’ , '~> 1.1.8'
  pod 'Alamofire'
  pod 'SwiftyJSON', '~> 4.0'  
  pod 'Shuffle-iOS'
  pod 'PopBounceButton'
  post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
       end
     end
  end
end
