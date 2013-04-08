require 'test_helper'

class ColumnTest < MiniTest::Unit::TestCase

  def test_stores_attributes
    col = PSQL::Column.new 'foo', 'bar', 'baz'
    assert { col.name      == 'foo' }
    assert { col.raw_type  == 'bar' }
    assert { col.modifiers == 'baz' }
  end
  def test_integer_type
    col = PSQL::Column.new 'id', 'integer'
    assert { col.type == :integer }
  end
  def test_float_type
    col = PSQL::Column.new 'rating', 'double precision'
    assert { col.type == :float }
  end
  def test_boolean_type
    col = PSQL::Column.new 'published', 'boolean'
    assert { col.type == :boolean }
  end
  def test_string_type
    col = PSQL::Column.new 'title', 'character varying(255)'
    assert { col.type == :string }
  end
  def test_text_type
    col = PSQL::Column.new 'body', 'text'
    assert { col.type == :text }
  end
  def test_datetime_type
    col = PSQL::Column.new 'created_at', 'timestamp without time zone'
    assert { col.type == :datetime }
  end
  def test_date_type
    col = PSQL::Column.new 'published_on', 'date'
    assert { col.type == :date }
  end
end
