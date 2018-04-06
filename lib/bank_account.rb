class BankAccount
  attr_accessor :status, :balance, :deposit
  attr_reader :name


  def initialize(name)
    @name = name
    @status = 'open'
    @balance = 1000
  end
  
  def deposit(balance)
       @balance += balance
  end
  
  def display_balance
    "Your balance is $#{balance}."
  end
  
  def valid?
    if status == "open" && balance > 0 then true else false
  end
end
  
  def close_account
    @status = "closed"
  end
end
