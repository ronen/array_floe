require 'bundler/gem_tasks'

task :default => :spec

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.main = 'README.rdoc'
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "array_floe #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
