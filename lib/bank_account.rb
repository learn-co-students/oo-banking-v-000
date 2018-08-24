class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  #upon instantiation the object is created with a given name, and a default
  #@status of open and @balance of $1000
  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  #allows for deposit of a valid amount to its @balance
  def deposit(amount)
    # binding.pry
    @balance = @balance + amount unless amount < 0
  end

  #allows for withdraw of a valid amount from its @balance
  def withdraw(amount)
    @balance = @balance - amount unless amount < 0
  end

  #confirms an account is valid if @status is set to "open" and #balance
  #returns a value greater than 0
  def valid?
    @status == "open" && @balance > 0 ? true : false
  end

  #changes @status to closed if the account is currently valid
  def close_account
    self.valid? ? @status = "closed" : "Unable to close account at this time."
    #Additional functionality to preven the closure of a funded or negative account:
      # if @status == "open" && @balance == 0
      #   @status = "closed"
      # elsif @status == "open" && @balance > 0
      #   "Unable to close a funded account."
      # else @status == "open" && @balance < 0
      #   "Unable to close account with a negative balance."
      # end
  end
end
