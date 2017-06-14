require 'pry'

class BankAccount
  attr_accessor :balance, :status, :transfer, :sender
  attr_reader :name
  @@all = []

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def deposit(money)
    @balance += money
  end

  def withdrawal(money)
    @balance -= money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @balance > 0 && @status == "open" ? true : false
  end

  def close_account
    @status = "closed"
  end

end
