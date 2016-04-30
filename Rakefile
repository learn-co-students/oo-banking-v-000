require_relative "./config/environment.rb"

puts "Welcome to Bank Accounts and Transfers..."

def reload!
  load "./lib/bank_account.rb"
  load "./lib/transfer.rb"
end

desc "A console"
task :console do
  Pry.start
end
