require 'pry'

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    self.balance += money
  end

  def display_balance
    "Your Balance is $#{balance}."
  end

  def valid?
    if self.balance <= 0 || self.status == "closed"
      return false
    else
      return true
    end
  end

  def close_account
    self.status = "closed"
  end
end