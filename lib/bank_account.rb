class BankAccount
  attr_reader :name
  attr_accessor :balance, :status


  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    ( self.balance <= 0 || self.status == "closed" ? false : true )
  end

  def close_account
    self.status = "closed"
  end
end