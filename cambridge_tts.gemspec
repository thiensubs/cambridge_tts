# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cambridge_tts/version'

Gem::Specification.new do |spec|
  spec.name          = "cambridge_tts"
  spec.version       = CambridgeTts::VERSION
  spec.authors       = ["Tien An"]
  spec.email         = ["anvotien@gmail.com"]

  spec.summary       = %q{With this library, you has text to speech via Cambridge Dictionnary.}
  spec.description   = %q{You want to listen or download word you input in english, now we intergarate with Cambridge Dictionnary for you, just try it.}
  spec.homepage      = "https://github.com/thiensubs/cambridge_tts"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "mechanize"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
