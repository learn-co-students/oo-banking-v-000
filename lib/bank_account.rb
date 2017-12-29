class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    # can initialize a Bank Account
    # initializes with a name
    # always initializes with balance of 1000
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    # can deposit money into its account
    # add new amount to the balance
    @balance += amount
  end

  def display_balance
    # can display its balance of the instance
    "Your balance is $#{self.balance}."
  end

  def valid?
    # is valid with an open status and a balance greater than 0
    self.balance > 0 && self.status == "open"
  end

  def close_account
    # can close its account
    # changes the "open" to "closed"
    self.status = "closed"
  end

end
