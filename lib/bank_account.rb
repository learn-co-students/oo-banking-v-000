class BankAccount
  attr_reader :name
  attr_accessor :status, :balance

  def initialize(name)
    @name = name
    @status = 'open'
    @balance = 1000
  end

  def deposit(amount)
    self.balance += amount
  end

  def withdraw(amount)
    self.balance -= amount
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == 'open' ? true : false
  end

  def close_account
    self.status = 'closed'
  end

end
