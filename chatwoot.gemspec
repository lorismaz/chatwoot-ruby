$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chatwoot/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "chatwoot"
  s.version = Chatwoot::VERSION
  s.authors = ["Loris Mazloum"]
  s.email = ["loris.mazloum@gmail.com"]
  s.homepage = "https://github.com/lorismaz"
  s.summary = "A ruby gem to interact with Chatwoot"
  s.description = "A ruby gem to interact with Chatwoot"
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rest-client", "~> 2"
end
