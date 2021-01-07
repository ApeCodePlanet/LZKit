

Pod::Spec.new do |spec|

  spec.name         = "LZKit"
  spec.version      = "1.0.0"
  spec.summary      = "LZKit is Core Kit"
  spec.homepage     = "https://github.com/ApeCodePlanet/LZKit"
  spec.author       = { "梁艳广" => "liangyanguang_vip@hotmail.com" }
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => 'https://github.com/ApeCodePlanet/LZKit.git', :tag => spec.version }
  spec.source_files  = 'LZKit/ZLKit/ZLClasses/**/*.{h,m}'
  spec.requires_arc = true
  spec.dependency "AFNetworking"
  spec.dependency "SDWebImage"
  spec.dependency "Reachability"
  spec.dependency "PPNetworkHelper"
  spec.dependency "MJExtension"
  spec.dependency "Masonry"
  spec.dependency "MBProgressHUD"
  spec.dependency "Toast"

end






