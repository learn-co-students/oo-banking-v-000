class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    self.balance += deposit
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open" #returns false if both conditions are not methods
  end

  def close_account
    self.status = "closed"
  end

end
