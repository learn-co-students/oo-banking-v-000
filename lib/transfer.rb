class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
 end

 def valid?
   sender.valid? && receiver.valid?
 end

 def execute_transaction
   if !sender.valid? || @sender.balance < @amount
     @status = "rejected"
     return "Transaction rejected. Please check your account balance."
   end
   if @status == "pending"
     @sender.balance -= @amount
     @receiver.balance += @amount
     @status = "complete"
   end
 end

 def reverse_transfer
   while @status == "complete"
     @sender.balance += @amount
     @receiver.balance -= @amount
     @status = "reversed"
   end
 end

end
