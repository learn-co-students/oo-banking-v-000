class BankAccount

  attr_accessor :balance, :status

  def initialize( account_holder )
    @account_holder = account_holder
    @balance = 1000
    @status = "open"
  end

  def name
    @account_holder
  end

  def deposit (amount)
    self.balance += amount
  end

  def withdraw (amount)
    self.balance -= amount
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open"
  end

  def close_account
    self.status = "closed"
  end
end
