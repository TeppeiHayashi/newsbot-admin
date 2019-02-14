require 'sinatra'
require 'sequel'
require 'logger'
require 'dotenv'
require_relative 'modules/utility'
require_relative 'models/category'
require_relative 'models/user'
require_relative 'models/click_log'
require_relative 'models/click_count'
require_relative 'app'

run NewsBotAdmin