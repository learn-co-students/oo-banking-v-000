class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = "open"
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def deposit(amt)
    self.balance += amt
  end

  def display_balance
    return "Your balance is $#{balance}."
  end

  def close_account
    self.status = "closed"
  end

end
