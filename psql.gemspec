# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'psql/version'

Gem::Specification.new do |gem|
  gem.name          = "psql"
  gem.version       = Psql::VERSION
  gem.authors       = ["Jeremy Ruppel"]
  gem.email         = ["jeremy.ruppel@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'cocaine', '0.5.1'

  gem.add_development_dependency 'wrong',          '0.7.0'
  gem.add_development_dependency 'pry',            '0.9.12'
  gem.add_development_dependency 'guard-minitest', '0.5.0'
  gem.add_development_dependency 'rb-fsevent',     '~> 0.9'
end
