class BankAccount
  
  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(name)
    @balance = @balance + 1000
  end
  
  def display_balance
    @balance = "#{1000}"
     "Your balance is $#{@balance}."
  end
  
  def valid?
    if@status == "open" && @balance > 0
      true
    else
      @status = "closed"
      false
    end
    end
    
    def close_account
      @status = "closed"
    end
      
  end
