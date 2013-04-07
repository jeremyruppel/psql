module PSQL
  class Database

    def initialize( name )
      @name = case name
      when String
        name
      when :rails
        find_rails_database_name
      end
    end
    attr_reader :name

    def table( table_name )
      Table.new table_name
    end
    alias :[] :table

    private

    def find_rails_database_name
      require 'yaml'

      file = `find . -name database.yml`.chomp
      hash = YAML.load_file( file )
      hash[ ENV[ 'RAILS_ENV' ] ][ 'database' ]
    end
  end
end
