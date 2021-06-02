# frozen_string_literal: true

require_relative 'lib/translate_self/version'

Gem::Specification.new do |spec|
  spec.name          = 'translate_self'
  spec.version       = TranslateSelf::VERSION
  spec.authors       = ['Sampo Kuokkanen']
  spec.email         = ['sampo.kuokkanen@gmail.com']

  spec.summary       = 'TranslateSelf lets strings translate themselves. '
  spec.description   = 'Let the strings do the job for you. No need to do any of the manual work! The strings translate themselves!!'
  spec.homepage      = 'https://github.com/sampokuokkanen/rails_material_design_icons'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "deepl-rb"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
