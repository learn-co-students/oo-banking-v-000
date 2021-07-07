class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  
 def initialize(sender, receiver, amount)
   @sender = sender 
   @receiver = receiver
   @status = "pending"
   @amount = amount
 end 
 
 def valid? 
   if @sender.valid? == true && @receiver.valid? == true 
     true
   end 
 end 
 
 def execute_transaction
   if @sender.balance > @amount == true && @status == "pending"
     @sender.balance -= @amount 
      @receiver.balance += @amount
      @status = "complete"
   elsif @status = "rejected"
   "Transaction rejected. Please check your account balance."
   end 
 end 
 
 def reverse_transfer
   if @status == "complete"
     @sender.balance += @amount 
     @receiver.balance -= @amount 
     @status = "reversed"
   end 
 end 
 
end
