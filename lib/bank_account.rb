class BankAccount
  attr_accessor :status, :balance
  attr_reader :name

  ACCOUNT = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(currency)#double check later
    @balance += currency
    ACCOUNT << balance
  end

  def withdraw(currency)
    @balance -= currency
    ACCOUNT << balance
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance == 1000 ? true : false
  end

  def close_account
    self.status.clear
    self.status = "closed"
  end
end
