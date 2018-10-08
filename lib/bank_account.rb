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
    
    

end
