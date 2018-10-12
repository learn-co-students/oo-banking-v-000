class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount  
    
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
    @amount = amount
  end 
  
  def valid? 
    if @sender.valid? == true  && @receiver.valid? == true 
      true 
    else 
      false 
    end 
  end 
  
  def execute_transaction 

    reject = "Transaction rejected. Please check your account balance."
    
    if @sender.valid? == false 
      reject  
    elsif @status == "complete"
      nil 
    else 
      @sender.pay(amount)
      @receiver.deposit(amount)
      @status = "complete"
    end 
    
  end 
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount)
      @receiver.pay(amount)
      @status ="reversed"
    else 
      nil 
    end 
  end 
  
end #ends class 
