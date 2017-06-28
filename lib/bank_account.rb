class BankAccount
  attr_accessor :balance, :bank_account, :status
  attr_reader :name

  def initialize(name, balance=1_000)
    @name = name
    @balance = balance
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    self.status = "closed"
  end

end
