class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def withdraw(amount)
    self.balance = self.balance - amount
  end

  def deposit(deposit_amount)
    self.balance = self.balance + deposit_amount
  end

  def has_enough?(amount)
    self.balance > amount ? true : false
  end

  def display_balance
    "Your Balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0 ? true : false
  end

  def close_account
    self.status = "closed"
  end

end