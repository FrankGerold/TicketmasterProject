require 'bundler'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/ticketmasterevents.db')
require_all 'app'

