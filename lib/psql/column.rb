module PSQL
  class Column

    ##
    #
    def initialize( name, raw_type, modifiers=nil )
      @name, @raw_type, @modifiers = name, raw_type, modifiers
    end
    attr_reader :name, :raw_type, :modifiers

    ##
    #
    def type
      case raw_type
      when 'integer'
        :integer
      when 'double precision'
        :float
      when 'boolean'
        :boolean
      when /^character varying/
        :string
      when 'text'
        :text
      when 'date'
        :date
      when 'timestamp without time zone'
        :datetime
      end
    end
  end
end
