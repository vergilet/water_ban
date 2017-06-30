$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "water_ban/core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "water_ban_core"
  s.version     = WaterBan::Core::VERSION
  s.authors     = ["YaroslavO"]
  s.email       = ["yaroslavo@softwareplanetgroup.com"]
  s.homepage    = "http://localhost"
  s.summary     = "Summary of Core."
  s.description = "Description of Core."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.1"

  # s.add_development_dependency "sqlite3"
end
