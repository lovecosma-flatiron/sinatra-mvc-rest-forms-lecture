require 'sinatra'
require 'require_all'
require 'active_record'
require 'sinatra/activerecord'
require 'rake'
require 'pry'

require_all 'app'

configure :development do
    set :database, 'sqlite3:db/playlister.db'
  end


