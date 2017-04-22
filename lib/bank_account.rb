class BankAccount
  attr_accessor :balance,:status
  attr_reader :name

  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = "open"
  end

  def deposit(amount)
    self.balance += amount
  end

  def withdrawal(amount)
    self.balance -= amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && status == "open"
  end

  def close_account
    self.status = "closed"
  end

end
