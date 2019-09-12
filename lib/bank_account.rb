class BankAccount
  attr_accessor :status, :balance, :transfer
  attr_reader :name
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end
  
  def withdraw(amount)
    @balance -= amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end
  
  def valid?
    balance > 0 && status == "open"
  end
  
  def sufficient_funds?
    balance > amount
  end
  
  def close_account
    @status = "closed"
  end

end
