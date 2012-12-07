$:.push File.expand_path("../lib", __FILE__)
require "midge/version"

Gem::Specification.new do |s|
  s.name        = "midge"
  s.version     = Midge::VERSION
  s.authors     = ["Jason Webb"]
  s.email       = ["bigjasonwebb@gmail.com"]
  s.homepage    = "https://github.com/bigjason/midge"
  s.summary     = "Quick and cheap javascript modules for the rails asset pipeline."
  # s.description = "TODO: Description of Midge."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1"

  s.add_development_dependency "sqlite3"
end
