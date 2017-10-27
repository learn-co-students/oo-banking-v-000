class Transfer
   attr_accessor :sender, :receiver, :amount, :status

   def initialize(sender, receiver, amount)
     @sender = sender
     @receiver = receiver
     @amount = amount
     @status = "pending"
   end

def valid?
  sender.valid? && receiver.valid? ? true : false
end

def execute_transaction
  if self.valid? && @status == "pending"
        sender.balance -= @amount
        receiver.balance += @amount
        if @sender.valid?
          @status = "complete"
       else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

    def reverse_transfer
      if @status == "complete"
        sender.balance += @amount
        receiver.balance -= @amount
        @status = "reversed"
      end
    end




end
