require_relative './config/environment'
require 'rake'
require 'rspec/core/rake_task'
puts "Welcome to "

def reload!
  load_all './lib'
  load_all '../spec'
  load './lib/bank_account.rb'
  load './lib/transfer.rb'
  load '../spec/banking_spec.rb'
  load '../spec/transfer_spec.rb'

end

desc "A console"
task :console do
  Pry.start
end