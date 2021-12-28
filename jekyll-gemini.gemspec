# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name        = 'jekyll-gemini'
  gem.version     = '0.1.0'
  gem.summary     = 'Gemini capsule extension for the Jekyll static site generator'
  gem.description = <<~DESCRIPTION
    Compile a Gemini capsule from any Gemtext pages in your site
  DESCRIPTION
  gem.authors     = ['Jeremy Wilkins']
  gem.email       = ['jeb@jdwilkins.co.uk']
  gem.homepage    = 'https://github.com/jebw/jekyll-gemini'
  gem.license     = 'MIT'
  gem.metadata    = {
    'rubygems_mfa_required' => 'true'
  }

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = %w[lib]
  gem.required_ruby_version = '>= 2.5.0'

  gem.add_dependency 'jekyll', '>= 3.7', '< 5.0'
  gem.add_dependency 'jekyll-gemtext', '~> 0.1'

  gem.add_development_dependency 'bundler', '~> 2.2'
  gem.add_development_dependency 'byebug', '~> 11.1'
  gem.add_development_dependency 'rake', '~> 13.0'
  gem.add_development_dependency 'rspec', '~> 3.10'
  gem.add_development_dependency 'rubocop', '~> 1.23'
  gem.add_development_dependency 'rubocop-rake', '~> 0.6'
  gem.add_development_dependency 'rubocop-rspec', '~> 2.6'
  gem.add_development_dependency 'simplecov', '~> 0.21'
  gem.add_development_dependency 'yard', '~> 0.9.26'
end
