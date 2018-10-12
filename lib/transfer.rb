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
   
    if @sender.valid? == false 
      "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      nil 
    else 
      @sender.pay(amount)
      @receiver.deposit(amount)
      @status = "complete"
    end   
  end 
end
