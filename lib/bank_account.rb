class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  @@all = []
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end
  def deposit(x)
    @balance += x
  end
  def display_balance
    return "Your balance is $#{@balance}."
  end
  def valid?
    self.balance > 0 && self.status == "open"
  end
  def close_account
    self.status = "closed"
  end
end
