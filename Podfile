# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

project 'SampleCode.xcodeproj'
use_frameworks!

def shared_pods
    pod 'AlamofireSwiftyJSON'
    pod 'SDWebImage', '~> 4.0'
end

target 'SampleCode' do

  # Pods for SampleCode

shared_pods

  target 'SampleCodeTests' do
    inherit! :search_paths
    # Pods for testing
    shared_pods
  end

end
