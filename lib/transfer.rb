require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? and receiver.valid? ? true : false  #passed!? How
  end
  
  def execute_transaction
    if self.valid? and @status == "pending" and @amount <= sender.balance
    sender.balance -= @amount
    receiver.balance += @amount
    @status = "complete"
    else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer
    if @status == "complete"
      receiver.balance -= @amount
      sender.balance += @amount 
      @status = "reversed"
    end
    
  end  
end
