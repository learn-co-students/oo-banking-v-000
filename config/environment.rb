require 'bundler'
Bundler.require
require_all 'lib'
require 'pry'

require_relative '../lib/bank_account.rb'
require_relative '../lib/transfer.rb'
require_relative '../spec/banking_spec.rb'
require_relative '../spec/transfer_spec.rb'
