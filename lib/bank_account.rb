require 'pry'
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(money)
    self.balance = self.balance + money
  end

  def display_balance
    balance = self.balance
    "Your balance is $#{balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open"
  end

  def close_account
    self.status = "closed"

  end

end
