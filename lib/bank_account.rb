require 'pry'
class BankAccount
  attr_reader :name
  attr_accessor  :status, :balance

  def initialize(name)
    @name = name 
    @balance = 1000  
    @status = "open" 
  end 

  def deposit(amount)
    @balance += amount 
  end 
  
  def display_balance
    "Your balance is $#{@balance}."
  end 
  
  def valid?
   if @balance <= 0 
     false 
   elsif @status == "closed"
     false 
   else 
     true 
   end 

  end 
  
  def close_account
    @status = "closed" 
  end 
  
  
end
