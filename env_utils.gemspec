# frozen_string_literal: true

require_relative "lib/env_utils/version"

Gem::Specification.new do |spec|
  spec.name          = "env_utils"
  spec.version       = EnvUtils::VERSION
  spec.authors       = ["Danielshow"]
  spec.email         = ["danielshotonwa53@gmail.com"]

  spec.summary       = "Ruby utilities for Env"
  spec.description   = "This gem provides Ruby utilities for Env"
  spec.homepage      = "https://github.com/danielshow/env_utils"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/danielshow/env_utils"
  spec.metadata["changelog_uri"] = "https://github.com/danielshow/env_utils/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "rubocop", "~> 1.7"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
