require 'json'

package = JSON.parse(File.read(File.join(__dir__, '../package.json')))

Pod::Spec.new do |s|
  s.name                = package['name']
  s.version             = "1.0.0"
  s.summary             = package['description']
  s.description         = <<-DESC
                            Cookie Manager for React Native
                         DESC
  s.homepage            = "https://github.com/vurtnec/vurtnec-react-native-cookies"
  s.license             = package['license']
  s.author              = "zacharyhou"
  s.source              = { :git => "git@github.com:vurtnec/vurtnec-react-native-cookies.git", :tag => "v#{s.version}" }
  s.requires_arc        = true
  s.platform            = :ios, "9.0"
  s.preserve_paths      = "*.framework"
  s.source_files        = 'RNCookieManagerIOS/*.{h,m}'
  s.dependency 'React'
end
