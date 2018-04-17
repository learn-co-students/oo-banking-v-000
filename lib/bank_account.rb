require "pry"
class BankAccount
  attr_reader :name, :balance, :status
  attr_writer :deposit_money, :balance, :status
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(deposit_money)
    @balance += deposit_money
  end
  
  def display_balance
    return "Your balance is $#{@balance}."
  end
  
  def valid?
    if self.status == "open" && self.balance > 0
      return true 
    else
      return false
    end
  end

  
  def close_account
    self.status = "closed"
  end

end
