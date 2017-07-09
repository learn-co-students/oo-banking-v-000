class BankAccount
  attr_accessor :account, :balance, :status
  attr_reader :name

  def initialize(name, *account)
    @name = name
    @account = account
    @balance = 1000
    @status = "open"
  end

  def deposit(ammount)
    @balance += ammount
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
