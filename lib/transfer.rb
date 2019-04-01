class Transfer
  attr_accessor :sender, :receiver, :amount, :status

   def initialize(sender, receiver, amount)
     @sender = sender
     @receiver = receiver
     @amount = amount
     @status = "pending"

   end

   def valid?
     @sender.valid? && @receiver.valid?
   end


     def execute_transaction
       if self.sender.balance > @amount && @status == "pending"
         @sender.balance -= self.amount
         self.receiver.balance += self.amount
         @status = "complete"
       #end
     else
         @status = "rejected"
         "Transaction rejected. Please check your account balance."
    end
     end

   def reverse_transfer
    if @status == "complete"
      @sender.balance += self.amount
      self.receiver.balance -= self.amount
      @status = "reversed"
    end
  end
end
