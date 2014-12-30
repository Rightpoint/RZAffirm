Pod::Spec.new do |s|
  s.name             = "RZAffirm"
  s.version          = "0.1.0"
  s.summary          = "Useful assertion functions from the fine folks at Raizlabs."
  s.description      = <<-DESC
                       Assertion functions for a range of conditions. Use RZAffirm to confirm equality, type, and much more.
                       DESC
  s.homepage         = "https://github.com/Raizlabs/RZAffirm"
  s.license          = 'MIT'
  s.author           = { "Michael Gorbach" => "michael.gorbach@raizlabs.com", "Joe Howard" => "joe.howard@raizlabs.com", "Matt Buckley" => "matt.buckley@raizlabs.com" }
  s.source           = { :git => "https://github.com/Raizlabs/RZAffirm.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/raizlabs'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'src'
end

