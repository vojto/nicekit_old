Pod::Spec.new do |s|
  s.name         = "NiceKit"
  s.version      = "0.0.1"
  s.summary      = "A short description of NiceKit."
  s.homepage     = "http://rinik.net/NiceKit"
  s.author       = { "Vojtech Rinik" => "vojto@rinik.net" }
  s.source       = { :git => "git@rinik.net:vojto/nicekit.git" }
  s.platform = :osx
  s.source_files = 'Classes', 'Classes/**/*.{h,m}', '*.{h,m}'
  s.requires_arc = true
  s.dependency 'BlocksKit'
end
