# PSQL

A simple ruby library for consuming the `psql` command. Created in order to
simply and quickly describe a PostgreSQL table without having to go through
ActiveRecord, so that's basically all you can do right now.

## Installation

Add this line to your application's Gemfile:

    gem 'psql'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install psql

## Usage

If you have the following schema in a database named `blog`:

                  Table "public.posts"
|    Column    |          Type         | Modifiers |
|--------------|-----------------------|-----------|
| id           | integer               | not null  |
| title        | character varying(55) |           |
| body         | text                  |           |

``` ruby
db = PSQL::Database.new 'blog'             # => instance of PSQL::Database
db.table( 'posts' )                        # => instance of PSQL::Table
db.table( 'posts' ).column( 'title' )      # => instance of PSQL::Column
db.table( 'posts' ).column( 'title' ).type # => :string

 # And the grand finale:

PSQL[ 'blog' ][ 'posts' ][ 'title' ].type # => :string
```

**PSQL** has no dependency on rails, but it can try and auto-detect your
rails database name if `RAILS_ENV` is set:

``` ruby
ENV[ 'RAILS_ENV' ]        # => "development"
PSQL::Database.new :rails # => attempts to locate database.yml and determine the database name
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
