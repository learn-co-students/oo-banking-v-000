require 'pry'
class BankAccount

  attr_accessor :balance, :status
  attr_reader :name
  @@accounts = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    @@accounts << self
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status == 'open' && @balance > 0
      return true
    else
      return false
    end
  end

  def close_account
    @status = 'closed'
  end

  def self.accounts
    @@accounts
  end

end
