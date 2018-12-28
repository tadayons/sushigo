# coding: utf-8
#this is the standard format for a gemspec file- contains info for a gem

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec| 
    spec.name          = "sushigo"
    spec.version       = '1.0'
    spec.authors       = ["Sara Tadayon"]
    spec.email         = ["svtadayon@gmail.com"]
    spec.summary       = %q{Sushi Go Web Application}
    spec.description   = %q{Online version of the beloved rummy-type game Sushi Go!}
    spec.homepage      = ""
    spec.license       = ""
  
    spec.files         = ['lib/sushigo.rb']
    spec.executables   = ['bin/sushigo']
    spec.test_files    = ['tests/test_sushigo.rb']
    spec.require_paths = ["lib"]
  end