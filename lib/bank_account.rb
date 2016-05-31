class BankAccount

  attr_accessor :bankaccount, :balance, :status
  attr_reader :name

  def initialize(name, balance = 1000, status = "open")
    @bankaccount = bankaccount
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(amount)
    self.balance = self.balance + amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    status == "open" && balance > 0
  end

  def close_account
    self.status = "closed"
  end

end
