class BankAccount
  attr_reader :name 
  attr_accessor :balance, :status

  def initialize(name, balance=1000)
    @name = name
    @balance = balance
    @status = "open"
  end

  def deposit(balance)
    @balance += balance 
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end

end