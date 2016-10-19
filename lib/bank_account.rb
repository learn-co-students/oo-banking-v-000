class BankAccount
  attr_accessor :balance, :status

  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.balance > 0 && @status == "open" ? true : false
  end

  def close_account
    self.status = "closed"
  end




end
