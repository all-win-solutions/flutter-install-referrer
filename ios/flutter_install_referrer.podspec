#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_install_referrer.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_install_referrer'
  s.version          = '2.0.1'
  s.summary          = 'Detect from where your application was installed (Google Play, App Store, TestFlight…)'
  s.description      = <<-DESC
Detect from where your application was installed (Google Play, App Store, TestFlight…)
                       DESC
  s.homepage         = 'https://all-win-solutions.com/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'All-Win Solutions' => 'info@all-win.solutions' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_install_referrer/Sources/flutter_install_referrer/**/*.swift'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
