class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(dollars)
    self.balance += dollars
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    (self.status == "open" && self.balance > 0) ? true : false
  end

  def close_account
    self.balance = 0
    self.status = "closed"
  end

end
