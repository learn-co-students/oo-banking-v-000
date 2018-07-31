class BankAccount
attr_accessor  :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  
  def deposit(money)
    @new_balance = @balance += money
    @new_balance
  end
  
  def display_balance
    self.balance
    "Your balance is $#{self.balance}."
  end
  
  def valid?
    ## -- if the account is open then it will have 1000 in the account 
    ## -- if the account is closed it will be less than 0 
    # if @status = "open"  ## status is open, which means there is more than  0 in the account
    if @status == "closed" || @balance == 0
      false
    else 
      true
    end
  end
      
  def close_account
    self.status
    @status = "closed"
  end

  

end
