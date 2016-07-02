class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance = 1000, status = "open")
    @balance = balance
    @name = name
    @status = status
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    status == "open" && balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end
end
