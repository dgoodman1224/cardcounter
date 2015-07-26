# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cardcounter/version'

Gem::Specification.new do |spec|
  spec.name          = "cardcounter"
  spec.version       = Cardcounter::VERSION
  spec.authors       = ["David Goodman"]
  spec.email         = ["goodman.david.h@gmail.com"]

  spec.summary       = "Work is overrated, learn how to gamble"
  spec.description   = "A gem to be able to practice counting cards via the command line"
  spec.homepage      = "https://github.com/dgoodman1224/cardcounter"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["cardcounter"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "colorize", "~> 0.7.7"
end
