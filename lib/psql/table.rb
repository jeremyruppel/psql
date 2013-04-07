module PSQL
  class Table

    def initialize( name )
      @name = name
    end
    attr_reader :name

    def describe
      Cocaine::CommandLine.new 'psql', '-At -c "\\d :name" :dbname'
    end
  end
end
