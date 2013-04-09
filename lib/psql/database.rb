module PSQL
  class Database

    ##
    #
    def initialize( name )
      @name = case name
      when String
        name
      when :rails
        find_rails_database_name
      end
    end
    attr_reader :name

    ##
    # Finds a database object by name. Objects are tables, views, or
    # sequences.
    def object( object_name )
      object = objects.find do |obj|
        obj[ 'name' ] == object_name
      end

      if !object
        raise "Database #{name} does not have an object named '#{object_name}'."
      end

      klass = PSQL.const_get object[ 'type' ].capitalize
      klass.new object[ 'name' ], name
    end
    alias :[] :object

    private

    ##
    # Lists all of the objects in this database. Objects are
    # tables, views, and sequences.
    def objects
      PSQL '\d', :dbname => name, :headers => %w| schema name type owner |
    end

    ##
    #
    def find_rails_database_name
      require 'yaml'

      raise(<<-EOS.strip) unless ENV[ 'RAILS_ENV' ]
      Cannot automatically determine rails database name because RAILS_ENV is not set.
      EOS

      file = `find . -name database.yml`.chomp
      hash = YAML.load_file( file )
      hash[ ENV[ 'RAILS_ENV' ] ][ 'database' ]
    end
  end
end
