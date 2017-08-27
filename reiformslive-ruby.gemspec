# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reiformslive/version'

Gem::Specification.new do |spec|
  spec.name          = "reiformslive-ruby"
spec.version       = REIformslive::VERSION
  spec.authors       = ["David Milanese"]
  spec.email         = ["milanese.david@gmail.com"]

  spec.summary       = %q{An API wrapper for REISA developers API in ruby}
  spec.description   = %q{An API wrapper for REISA developers API in ruby}
  spec.homepage      = "https://github.com/aussiDavid/reiformslive-ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "json", "~> 2.1.0"
  spec.add_development_dependency "faraday", "~> 0.13.1"
end
