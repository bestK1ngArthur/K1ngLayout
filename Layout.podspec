Pod::Spec.new do |spec|

  spec.name         = "Layout"
  spec.version      = "0.0.1"
  spec.summary      = "Simple autolayout wrapper"

  spec.description  = <<-DESC
  Simple UIKit autolayout wrapper to improve code cleanliness and readability
                   DESC

  spec.homepage     = "https://github.com/bestK1ngArthur/Layout"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Artem Belkov" => "bestk1ngarthur@aol.com" }

  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/bestK1ngArthur/Layout.git", :tag => "#{spec.version}" }

  spec.source_files  = "Layout", "Layout/**/*.{h,swift}"
  spec.exclude_files = "Layout/Exclude"
  spec.swift_version = "5.0"

end
