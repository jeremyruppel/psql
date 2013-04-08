require 'minitest/autorun'
require 'wrong/adapters/minitest'
require 'psql'

# class DatabaseTestRunner < MiniTest::Unit
#
#   def _run_suites(*)
#     before_suite
#     super
#   ensure
#     after_suite
#   end
#
#   def before_suite
#     `createdb psql_gem_test`
#   end
#
#   def after_suite
#     `dropdb psql_gem_test`
#   end
# end
#
# MiniTest::Unit.runner = DatabaseTestRunner.new
