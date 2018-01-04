require 'pry'

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def deposit(amount)
    @balance += amount
  end

  def valid?
    if @balance > 0 && @status != "closed"
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

end
