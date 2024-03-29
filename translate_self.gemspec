# frozen_string_literal: true

require_relative 'lib/translate_self/version'

Gem::Specification.new do |spec|
  spec.name          = 'translate_self'
  spec.version       = TranslateSelf::VERSION
  spec.authors       = ['Sampo Kuokkanen']
  spec.email         = ['sampo.kuokkanen@gmail.com']

  spec.summary       = 'TranslateSelf lets strings translate themselves. '
  spec.description   = 'Let the strings do the job for you. No need to do any of the manual work! \
                        The strings translate themselves!! Translate to Japanese, English, Finnish...'
  spec.homepage      = 'https://github.com/sampokuokkanen/translate_self'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features|spaghetti)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'deepl-rb'
  spec.add_dependency 'defrost', '~> 1.0'
  spec.add_dependency 'dry-configurable', '~> 0.1.3'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'rubocop', '~> 1.7'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'byebug'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
