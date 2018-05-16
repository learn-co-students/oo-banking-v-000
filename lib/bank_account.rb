class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def balance=(amount)
    @balance = amount.to_i
  end

  def deposit(amount)
    self.balance += amount.to_i
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open"
  end

  def close_account
    self.balance = 0
    self.status = "closed"
  end


end
