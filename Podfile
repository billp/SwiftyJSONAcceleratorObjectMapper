platform :osx, '10.10'
use_frameworks!
inhibit_all_warnings!


target 'SwiftyJSONAccelerator' do
  pod 'SwiftyJSON'
end

target 'SwiftyJSONAcceleratorTests' do
  pod 'SwiftyJSON'
  pod 'Nimble'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
