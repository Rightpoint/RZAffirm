PROJ_PATH="Example/RZAffirm.xcodeproj"
TEST_SCHEME="RZAffirmTests"

#
# Install
#

namespace :install do
  
  task :tools do
    # don't care if this fails on travis
    sh("brew update") rescue nil
    sh("gem install cocoapods --pre --no-rdoc --no-ri --no-document --quiet") rescue nil
  end

  task :pods do
    sh("cd Example && pod update && pod install && cd ../")
  end
  
end

task :install do
  Rake::Task['install:tools'].invoke
  Rake::Task['install:pods'].invoke
end

#
# Test
#

task :test do
  sh("xcodebuild -project '#{PROJ_PATH}' -scheme '#{TEST_SCHEME}' -sdk iphonesimulator -destination 'name=iPhone 6' build test") rescue nil
  exit $?.exitstatus
end

#
# Analyze
#

task :analyze do
  sh("xcodebuild -project '#{PROJ_PATH}' -scheme '#{TEST_SCHEME}' -sdk iphonesimulator analyze") rescue nil
  exit $?.exitstatus
end

#
# Clean
#

namespace :clean do
  
  task :example do
    sh("xcodebuild -project '#{PROJ_PATH}' -scheme '#{TEST_SCHEME}' -sdk iphonesimulator clean") rescue nil
  end
    
end

task :clean do
  Rake::Task['clean:example'].invoke
end


#
# Utils
#

task :usage do
  puts "Usage:"
  puts "  rake test          -- run unit tests"
  puts "  rake clean         -- clean everything"
  puts "  rake clean:example -- clean the example project build artifacts"
  puts "  rake usage         -- print this message"
end

#
# Default
#

task :default => 'usage'
