require 'pry'
class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance = 1000, status="open")
    @name = name
    @balance = balance
    @status = status
    
  end

  def deposit(balance)
    self.balance += 1000
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if  @status == "closed" || @balance == 0
      false
    else
      true
    end
  end

  def close_account
    self.status = "closed"
  end

end
