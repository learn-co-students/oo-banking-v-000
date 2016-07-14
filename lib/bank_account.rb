# Bank Account Class
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    self.balance -= amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    return false if self.status == 'closed' || self.balance <= 0
    true
  end

  def close_account
    self.status = 'closed'
  end
end
