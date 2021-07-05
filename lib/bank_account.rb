class BankAccount

  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name= name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
    @balance
  end

  def display_balance
    p "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance >= 1000
      return true
    else
      return false
    end
  end
  
  def close_account
    @status = "closed"
  end
  
  


end
