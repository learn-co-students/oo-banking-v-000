class BankAccount
  #attributes
  attr_accessor :balance, :status
  attr_reader :name

  #initialize
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  #INSTANCE methods
  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open" ? true : false
  end

  def close_account
    self.status = "closed"
  end

end
