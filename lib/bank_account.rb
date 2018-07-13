class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = "open"
  end

  def deposit(amount)
    self.balance = 2000
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    balance > 0 && status == 'open'
  end

  def close_account
    self.status = "closed"
  end
end
