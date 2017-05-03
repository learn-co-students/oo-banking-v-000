require 'pry'

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  @@accounts = []

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
    @@accounts << self
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    balance > 0 && status == "open"
  end

  def close_account
    self.status = "closed"
  end

end
