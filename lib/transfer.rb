require 'pry'
class Transfer
  attr_accessor :receiver, :amount,:sender, :status
  
  def initialize(sender, receiver, amount)
    @receiver = receiver 
    @sender = sender 
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if self.sender.valid? && self.receiver.valid?
      true  
    else
      false
    end
  end
  
  def execute_transaction
     if self.valid? && self.status == "pending" && self.sender.balance > amount 
      receiver.balance += amount 
      sender.balance -= amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
 end
 
 def reverse_transfer
   if self.status == "complete"
     receiver.balance -= amount 
     sender.balance += amount 
     self.status = "reversed"
   end
end
  
end
