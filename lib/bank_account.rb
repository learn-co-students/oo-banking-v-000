require 'pry'

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name, :amount

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    self.status == "open" && @balance > 0
  end

  def close_account
    self.status = "closed"
  end

end
