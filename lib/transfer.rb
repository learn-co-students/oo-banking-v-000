class Transfer
  
  attr_accessor :status 
  attr_reader :sender, :receiver, :amount 


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end 
  
  
  def valid? 
    sender.valid? && receiver.valid? 
  end 
  
  
  def execute_transaction
    if sender.valid? && receiver.valid? && sender.balance > 0 && self.status == "pending"
      sender.balance -= amount 
      receiver.balance += amount 
      self.status = "complete" 
    else 
      reject_transfer
    end 
  end 
  
  
  def reverse_transfer 
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else 
      reject_transfer
     end  
    
  end 
  
  
end   