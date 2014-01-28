$:.push File.expand_path("../lib", __FILE__)
require 'array_floe/version'

Gem::Specification.new do |s|
  s.name = 'array_floe'
  s.version = ArrayFloe::VERSION
  s.platform = Gem::Platform::RUBY
  s.date = "2011-04-23"
  s.authors = ["ronen barzel"]
  s.email = 'ronen@barzel.org'
  s.homepage = %q{http://github.com/ronen/array_floe}
  s.summary = %q{Provides iterators Array#each_with_floe and Array#each_with_index_floe}
  s.description = %q{
This small extension to ruby's Array class provides two additional
iterators, Array#each_with_floe and Array#each_with_index_floe, that
simplify the reasonably-common need to specially handle "floe"--i.e.,
first, last, odd, even--when iterating through the elements of an array.
It's particularly handy for generating CSS classes.
  }

  s.required_rubygems_version = Gem::Requirement.new('>= 1.3.7')
  s.rubygems_version = '1.3.7'
  s.specification_version = 3

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'simplecov-gem-adapter'
end

