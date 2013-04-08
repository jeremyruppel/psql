require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end

task :default => :test

namespace :db do

  desc 'Create the test database'
  task :create do
    sh 'createdb psql_gem_test'
  end

  desc 'Migrate the test database'
  task :migrate do
    sh 'psql --file ./test/fixtures/database.sql psql_gem_test'
  end

  task :setup => [ :create, :migrate ]
  task :reset => [ :drop, :setup ]

  desc 'Drop the test database'
  task :drop do
    sh 'dropdb psql_gem_test'
  end
end
