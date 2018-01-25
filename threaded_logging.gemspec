# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name           = "threaded_logging"
  spec.version        = "0.2"
  spec.authors        = ["Yuri Smirnov"]
  spec.email          = "tycoooon@gmail.com"

  spec.summary        = "Better formatter for ruby loggers."
  spec.description    = "Add current thread's fingerprint to all your logs."
  spec.homepage       = "https://github.com/umbrellio/threaded_logging"
  spec.license        = "MIT"

  spec.files          = ["lib/threaded_logging.rb"]
  spec.require_paths  = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop-config-umbrellio"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "timecop"
end
