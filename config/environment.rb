require 'bundler'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/ticketmasterevents.db')

<<<<<<< HEAD
require_all 'app'
=======

require_all 'app'

>>>>>>> Tristan
