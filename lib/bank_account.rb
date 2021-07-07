class BankAccount
attr_accessor :balance, :status
attr_reader :name

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
    @transactions = []
  end  
  
  def deposit(amount)
    @balance += amount
  end   

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?(balance = 0)
    @status == "open" && @balance > balance
  end 

  def close_account(status = "closed")
    @status = status
  end

end  
