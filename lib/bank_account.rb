class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(n)
    @balance = 1000
    @status = "open"
    @name = n
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
    @balance > 0 && @status != "closed"
  end

  def close_account
    @status = "closed"
  end
end