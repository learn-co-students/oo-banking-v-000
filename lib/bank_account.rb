class BankAccount
  attr_reader :name 
  attr_accessor :balance, :status 
  # code here

  def initialize(name, balance = 1000, status = "open")
    @name = name 
    @balance = balance
    @status = status 
  end 

  def deposit(amount)
    if amount != nil
    @balance = @balance += amount 
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0 
  end 
  end

  def close_account
    @status = "closed"
  end 

end