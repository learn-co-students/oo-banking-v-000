class BankAccount
  attr_accessor :balance, :status
  attr_reader :name, :transfers

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount unless amount < 0
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.balance = 0
    self.status = "closed"
  end
end