require_relative 'transfer.rb'

class BankAccount

attr_accessor :balance, :status

attr_reader :name

  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    status == "open" && self.balance > 0 ? true : false
  end

  def close_account
    self.status = "closed"
  end

end
