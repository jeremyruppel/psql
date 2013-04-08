require 'test_helper'

class DatabaseTest < MiniTest::Unit::TestCase

  def test_stores_database_name
    db = PSQL::Database.new 'psql_gem_test'
    assert { db.name == 'psql_gem_test' }
  end
  def test_reads_rails_database_config
    ENV[ 'RAILS_ENV' ] = 'test'
    db = PSQL::Database.new :rails
    assert { db.name == 'psql_gem_test' }
  end
  def test_object_raises_error_if_not_found
    db = PSQL::Database.new 'psql_gem_test'
    assert { rescuing { db.object( 'foo' ) }.message =~ /Database psql_gem_test does not have an object named 'foo'./ }
  end
  def test_object_returns_table_object
    db = PSQL::Database.new 'psql_gem_test'
    assert { db.object( 'posts' ).is_a?( PSQL::Table ) }
  end
  def test_hash_access_returns_table_object
    db = PSQL::Database.new 'psql_gem_test'
    assert { db[ 'posts' ].is_a?( PSQL::Table ) }
  end
end
