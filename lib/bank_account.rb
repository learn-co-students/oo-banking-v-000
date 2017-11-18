class BankAccount
attr_accessor :balance, :status
@@accounts = []

  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = "open"
    @@accounts << self
  end

  def name
    @name
  end

  def deposit(deposit)
    self.balance = self.balance + deposit
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.status = "closed"
  end

end
