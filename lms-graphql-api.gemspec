$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lms_graphql/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lms-graphql-api"
  s.version     = LMSGraphQL::VERSION
  s.authors     = ["Atomic Jolt", "Justin Ball"]
  s.email       = ["justin.ball@atomicjolt.com"]
  s.homepage    = "https://github.com/atomicjolt/lms_graphql_api"
  s.summary     = "GraphQL wrapper for the Instructure Canvas API"
  s.description = "GraphQL wrapper for the Instructure Canvas API"
  s.license     = "MIT"

  s.required_ruby_version = ">= 2.2"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "graphql", ">=1.8.2"
  s.add_dependency "lms-api", ">=1.5.0"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "byebug"
end
