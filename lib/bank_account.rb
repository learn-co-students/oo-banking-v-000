require 'pry'
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end

  def self.all
    @@all
  end

  def deposit(ammount)
    @balance += ammount
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
