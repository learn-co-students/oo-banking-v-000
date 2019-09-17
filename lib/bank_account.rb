class BankAccount
  attr_accessor :balance , :status
  attr_reader :name

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end
  def deposit(money)
    @balance += money
  end
  def display_balance
    "Your balance is $#{@balance}."
  end
  def valid?
    self.status == "open" && self.balance > 0
  end
  def close_account
    self.status = "closed"
  end
end
