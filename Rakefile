require "rake/testtask"

group :test do
  gem 'rake'
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
end

desc "Run tests"

task default: :test
