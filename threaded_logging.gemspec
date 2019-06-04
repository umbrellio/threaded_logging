# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "threaded_logging/version"

Gem::Specification.new do |spec|
  spec.required_ruby_version = ">= 2.3.8"

  gem_version = ThreadedLogging::VERSION
  release_version = ENV["TRAVIS"] ? "#{gem_version}.#{ENV["TRAVIS_BUILD_NUMBER"]}" : gem_version

  spec.name    = "threaded_logging"
  spec.version = release_version
  spec.authors = ["Yuri Smirnov"]
  spec.email   = ["tycoooon@gmail.com", "oss@umbrellio.biz"]

  spec.summary     = "Better formatter for ruby loggers."
  spec.description = "Add current thread's fingerprint to all your logs."
  spec.homepage    = "https://github.com/umbrellio/threaded_logging"
  spec.license     = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^spec/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop-config-umbrellio"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "timecop"
end
