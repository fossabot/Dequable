Pod::Spec.new do |s|
  s.name               = "Dequable"
  s.version            = "1.0.0"
  s.summary            = "Write strongly typed let constants for your dequable UI components and limit the need for string based cell identifiers."
  s.description        = "Dequable allows you to write strongly typed let constants for your dequable UI components and limits the need for string based cell identifiers. If you don't use interface builder, then you will not need to declare any cell identifiers."
  s.homepage           = "https://github.com/rob-nash/Dequable"
  s.license            = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Robert Nash" => "robscode@icloud.com" }
  s.social_media_url   = "https://twitter.com/nashytitz"
  s.platform           = :ios, "10.0"
  s.source             = { :git => "https://github.com/rob-nash/Dequable.git", :tag => "#{s.version}" }
  s.source_files       = "Dequable/*.{swift}"
  s.requires_arc       = true
end
