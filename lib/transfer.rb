require "pry"
class Transfer
  
 attr_accessor :sender, :receiver, :status, :amount

 def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @status = "pending"
   @amount = amount
 end
 
 def valid? 
  sender.valid? && receiver.valid? ? true : false
 end
 
 def execute_transaction
   if sender.balance >= amount && status == "pending" && valid?
     sender.balance -= amount
     receiver.balance += amount
     @status = "complete"
    elsif sender.balance < amount 
      @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end 
 end
 
 def reverse_transfer
  if receiver.balance >= amount && status == "complete" && valid?
     receiver.balance -= amount 
     sender.balance += amount 
     @status = "reversed"
   end
 end
 
end
