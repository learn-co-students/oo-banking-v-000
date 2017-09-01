require 'pry'
class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    self.balance -= amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    (self.balance.zero? || self.status == 'closed') ? false : true
  end

  def close_account
    self.status = 'closed'
  end

end
