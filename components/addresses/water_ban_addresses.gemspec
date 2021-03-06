$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "water_ban/addresses/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "water_ban_addresses"
  s.version     = WaterBan::Addresses::VERSION
  s.authors     = ["YaroslavO"]
  s.email       = ["yaroslavo@softwareplanetgroup.com"]
  s.homepage    = "http://localhost"
  s.summary     = "Summary of WaterBan::Addresses."
  s.description = "Description of WaterBan::Addresses."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.1.1"
  s.add_dependency "deface"
  s.add_dependency "responders"

  s.add_dependency 'elasticsearch-rails'
  s.add_dependency 'elasticsearch-model'

  # s.add_dependency 'searchkick'
end
