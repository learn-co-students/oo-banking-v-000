class BankAccount

attr_accessor :balance, :status

attr_reader :name  

  def initialize(name)
    @name = name
    @balance = 1000 
    @status = "open"
  end

  def deposit(deposit)
    @balance = @balance + deposit  
  end

  def display_balance 
    "Your Balance is $#{@balance}." 
  end

  def balance
    @balance
  end 

  def valid?
    if @status == "open" && @balance > 0
      true
    else 
      false  
    end
  end   
  
  def close_account
    @status = "closed"  
  end    

end
