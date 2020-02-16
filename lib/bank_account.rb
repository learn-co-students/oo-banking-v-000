class BankAccount
  attr_accessor :balance, :status, :sender, :receiver
  attr_reader :name 

  def initialize(name)
    @name = name.freeze
    @balance = 1000
    @status = "open"
  end
  
  def deposit(amount)
    @balance = @balance + amount
    @balance
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    if @balance > 0 && @status == "open"
      true 
    else 
      false 
    end
  end
  
  def close_account
    @balance = 0 
    @status = "closed"
  end
end
