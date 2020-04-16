require 'bundler/setup'
require 'pry'
Bundler.require

require_all 'lib'
ActiveRecord::Base.logger.level = nil

# binding.pry