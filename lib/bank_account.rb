require 'pry'
class BankAccount
  attr_accessor :balance, :status, :deposit
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @deposit = 0
  end

  def deposit(deposit)
    self.balance += deposit
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    (@status == "open" && self.balance > 0) ? true : false
  end

  def close_account
    @status = "closed"
  end

end
