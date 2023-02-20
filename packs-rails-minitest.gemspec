require_relative "lib/packs/rails/minitest/version"

Gem::Specification.new do |spec|
  spec.name = "packs-rails-minitest"
  spec.version = Packs::Rails::Minitest::VERSION
  spec.authors = ["Graham Rogers"]
  spec.email = ["graham@ophelos.com"]
  spec.homepage = "https://github.com/Ophelos/packs-rails-minitest"
  spec.summary = "Integrate packs-rails with minitest"
  spec.description = "Runs tests in packs using minitest."
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Ophelos/packs-rails-minitest"
  spec.metadata["changelog_uri"] = "https://github.com/Ophelos/packs-rails-minitest/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "packs", "~> 0"
  spec.add_dependency "activesupport", "~> 7"
  spec.add_dependency "railties", "~> 7"
end
