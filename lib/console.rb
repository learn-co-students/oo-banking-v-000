require 'pry'

def reload!
    load 'lib/bank_account.rb'
    load 'lib/transfer.rb'
end

require_relative './bank_account.rb'
require_relative './transfer.rb'

Pry.start
