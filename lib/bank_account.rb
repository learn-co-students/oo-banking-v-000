class BankAccount

  attr_accessor :balance, :status, :valid, :broke
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    #  ????? self.balance ????
    self.balance = self.balance + amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def broke
    self.balance = 0
  end

  def valid?
    self.balance > 0 && self.status == "open" ? true : false
  end

  def close_account
    self.status = "closed"
  end

end
