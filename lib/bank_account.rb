class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amount)
    self.balance += deposit_amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def close_account
    self.status = "closed"
  end

  def withdraw(withdraw_amount)
    self.balance -= withdraw_amount
  end

  def valid?
    self.status == "open" && self.balance > 0
  end
end
