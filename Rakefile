require "bundler/gem_tasks"

begin
  require 'rspec/core/rake_task'
  # Set default Rake task to spec
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError => ex
  # That's ok, it just means we don't have RSpec loaded
end