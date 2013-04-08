require 'psql/version'

module PSQL
  autoload :Column,   'psql/column'
  autoload :Database, 'psql/database'
  autoload :Table,    'psql/table'

  def []( name )
    Database.new name
  end
  module_function :[]
end

require 'cocaine'
require 'csv'

def PSQL( command, params )
  cmd = Cocaine::CommandLine.new 'psql', '-tAc "%s" :dbname' % [ command ]

  if headers = params.delete( :headers )
    CSV.parse cmd.run( params ), :headers => headers, :col_sep => '|'
  else
    cmd.run params
  end
end
