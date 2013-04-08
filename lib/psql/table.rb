module PSQL
  class Table

    ##
    #
    def initialize( name, dbname )
      @name, @dbname = name, dbname
    end
    attr_reader :name, :dbname

    ##
    #
    def column( column_name )
      column = columns.find do |col|
        col[ 'name' ] == column_name
      end

      if !column
        raise "Table #{name} does not have a column named '#{column_name}'."
      end

      Column.new column[ 'name' ], column[ 'type' ], column[ 'modifiers' ]
    end
    alias :[] :column

    def column_names
      columns.map { |col| col[ 'name' ] }
    end

    private

    ##
    #
    def columns
      @columns ||= PSQL '\d :name',
        :name    => name,
        :dbname  => dbname,
        :headers => %w| name type modifiers |
    end
  end
end
