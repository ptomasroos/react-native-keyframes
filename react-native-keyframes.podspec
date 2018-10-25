require 'json'
package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "react-native-keyframes"
  s.version      = package['version']
  s.summary      = package['description']
  s.author       = package['author']

  s.homepage     = "https://github.com/ptomasroos/react-native-keyframes"

  s.license      = "MIT"
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/ptomasroos/react-native-keyframes.git", :tag => "#{s.version}" }
  s.source_files = "ios/Keyframes/*.{h,m}"

  s.dependency "React"
  s.dependency "keyframes"
end
