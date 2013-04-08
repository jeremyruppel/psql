require 'test_helper'

class TableTest < MiniTest::Unit::TestCase

  def test_stores_name_and_database_name
    table = PSQL::Table.new 'foo', 'bar'
    assert { table.name == 'foo' }
    assert { table.dbname == 'bar' }
  end
  def test_column_raises_error_if_not_found
    table = PSQL::Table.new 'posts', 'psql_gem_test'
    assert { rescuing { table.column( 'foo' ) }.message =~ /Table posts does not have a column named 'foo'./ }
  end
  def test_column_returns_column_object
    table = PSQL::Table.new 'posts', 'psql_gem_test'
    assert { table.column( 'title' ).is_a?( PSQL::Column ) }
  end
  def test_hash_access_returns_column_object
    table = PSQL::Table.new 'posts', 'psql_gem_test'
    assert { table[ 'title' ].is_a?( PSQL::Column ) }
  end
end
