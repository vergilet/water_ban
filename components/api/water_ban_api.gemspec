$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "water_ban/api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "water_ban_api"
  s.version     = WaterBan::Api::VERSION
  s.authors     = ["YaroslavO"]
  s.email       = ["yaroslavo@softwareplanetgroup.com"]
  s.homepage    = "http://localhost"
  s.summary     = "Summary of WaterBan::Api."
  s.description = "Description of WaterBan::Api."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.1.1"
  s.add_dependency 'active_model_serializers', '~> 0.8.3'
  s.add_dependency "responders"

  s.add_dependency "deface"
end
