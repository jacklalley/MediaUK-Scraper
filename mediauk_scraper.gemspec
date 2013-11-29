# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mediauk_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = "mediauk_scraper"
  spec.version       = MediaukScraper::VERSION
  spec.authors       = ["jacklalley"]
  spec.email         = ["jckly13@gmail.com"]
  spec.description   = %q{Random description}
  spec.summary       = %q{Random Summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"

  spec.add_dependency "mechanize"

end
