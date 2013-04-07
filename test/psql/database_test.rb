require 'test_helper'

class DatabaseTest < MiniTest::Unit::TestCase

  def test_stores_database_name
    db = PSQL::Database.new 'foo'
    assert { db.name == 'foo' }
  end
  def test_reads_rails_database_config
    ENV[ 'RAILS_ENV' ] = 'test'
    db = PSQL::Database.new :rails
    assert { db.name == 'test_database_name' }
  end
  def test_table_returns_table_object
    db = PSQL::Database.new 'foo'
    assert { db.table( 'posts' ).is_a?( PSQL::Table ) }
  end
  def test_hash_access_returns_table_object
    db = PSQL::Database.new 'foo'
    assert { db[ 'posts' ].is_a?( PSQL::Table ) }
  end
end
