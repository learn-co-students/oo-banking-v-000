class BankAccount
  attr_accessor :status, :balance

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name
    @name
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end
end
