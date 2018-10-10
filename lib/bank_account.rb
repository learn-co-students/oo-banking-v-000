require 'pry'

class BankAccount
attr_accessor :bank_account, :balance, :status
attr_reader :name 

  def initialize(name)
    @bank_account = bank_account
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance = balance + amount 
    @balance
  end 
  
  def display_balance
    return "Your balance is $#{balance}."
  end 
  
  def valid?
    self.status == "open" && self.balance > 0 ?
    true: false      
  end 
    
  def close_account
    @status = "closed"
  end 

end 
