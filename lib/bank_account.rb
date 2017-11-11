require 'pry'

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def balance
    @balance
  end

  def status
    @status
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @balance <= 0 || @status == "closed"
      false
    else
      true
    end
  end

  def close_account
    self.status = "closed"
  end

end
