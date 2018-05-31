class BankAccount
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  attr_reader :name
  
  attr_accessor :balance, :status
  
  def deposit(money)
    @balance += money if money == money.to_i
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    @status == "open" && @balance > 0 ? true : false
  end
  
  def close_account
    @status = "closed"
  end
end
