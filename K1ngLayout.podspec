Pod::Spec.new do |spec|

  spec.name         = "K1ngLayout"
  spec.version      = "0.0.2"
  spec.summary      = "Simple autolayout wrapper"

  spec.description  = <<-DESC
  Simple UIKit autolayout wrapper to improve code cleanliness and readability
                   DESC

  spec.homepage     = "https://github.com/bestK1ngArthur/K1ngLayout"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Artem Belkov" => "bestk1ngarthur@aol.com" }

  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/bestK1ngArthur/K1ngLayout.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources", "Sources/K1ngLayout/**/*.{h,swift}"
  spec.exclude_files = "Sources/K1ngLayout/Exclude"
  spec.swift_version = "5.0"

end
