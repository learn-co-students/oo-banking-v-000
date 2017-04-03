class BankAccount
  attr_writer :balance, :status           # doing this because the BDD tests require it, but not good practice.
  attr_reader :name, :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amt)
    self.balance += deposit_amt if deposit_amt >=0
  end

  def withdraw(withdraw_amt)
    (withdraw_amt >= 0 && withdraw_amt < self.balance) ? (self.balance -= withdraw_amt) : ("Transaction rejected. Please check your account balance.")
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    (self.balance > 0 && self.status == "open") ? true : false
  end

  def close_account
    self.status = "closed"
  end
end
