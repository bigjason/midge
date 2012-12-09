$:.push File.expand_path("../lib", __FILE__)
require "midge/version"

Gem::Specification.new do |s|
  s.name        = "midge"
  s.version     = Midge::VERSION
  s.authors     = ["Jason Webb"]
  s.email       = ["bigjasonwebb@gmail.com"]
  s.homepage    = "https://github.com/bigjason/midge"
  s.summary     = "Quick and cheap javascript modules for the rails asset pipeline."
  s.description = File.read(File.expand_path("../README.md", __FILE__))

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "execjs"
  s.add_development_dependency "pry"
end
