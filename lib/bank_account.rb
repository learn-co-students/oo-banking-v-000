class BankAccount
  attr_reader :name
  attr_accessor :status, :balance

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(integer)
    self.balance += integer
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    switch = false
    switch = true if self.status == "open" && self.balance > 0
    switch
  end

  def close_account
    self.status = "closed"
  end




end
