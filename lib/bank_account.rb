class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance = 1000, status = "open") #set default arguments here (name is the only required arguement, if none for balance or stautus is given, instance will have the default values)
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(amount)
    @balance += amount  #someVr += other Var equals someVar = someVar + otherVar
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid? #instance method, instance already created with name, balance, and status, so you don't need argument here
   @status == "open" && @balance > 0 ? true : false #if the status is open AND the balance is greater than 0, put true. else, put false.
  end

  def close_account
    @status = "closed"
  end
end
