require 'pry'

class BankAccount

  attr_accessor :name, :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name=(name)
    @name.raise ("Exception")
  end

  def deposit(money_amount)
    @balance += money_amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.status = "closed"
  end
end



