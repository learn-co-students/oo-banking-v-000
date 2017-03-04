class BankAccount
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  attr_reader :name
  attr_accessor :balance, :status

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open" || false
  end

  def close_account
    @status = "closed"
  end

end
