require "pry"

class BankAccount
  
  attr_accessor :balance, :deposit, :accounts, :status
  attr_reader :name, :sender, :receiver 
  
  @@accounts = {}

 def initialize(name)
   @name = name 
   @balance = 1000
   @status = "open"
   @@accounts[name] = [balance, status] 
 end
 
 def deposit(deposit)
   @balance = balance + deposit
 end
 
 def display_balance
   "Your balance is $#{balance}."
   #binding.pry 
 end
 
 def valid?
   if balance > 0 && status == "open"
     return true
   else
     return false  
   end
 end
 
 def close_account
   @status = "closed"
 end
 
end
