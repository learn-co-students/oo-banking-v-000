require 'pry'
class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def broke
    if balance <= 0
      @broke = true
    else
      @broke = false
    end
  end

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @broke = false
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == "open" && self.broke == false
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

end