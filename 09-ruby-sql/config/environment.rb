require 'bundler'
Bundler.require

DB = {
  conn: SQLite3::Database.new('db/music.sqlite')
}

DB[:conn].results_as_hash = true

require_relative '../lib/fan.rb'
