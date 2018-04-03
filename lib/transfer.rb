class Transfer
      attr_reader :amount, :status, :sender, :receiver , :last_transfer
  
   def initialize(sender, receiver, amount)
     @amount = amount
     @status = 'pending'
     @receiver = receiver
     @sender = sender
   end
   
   def valid?
     sender.valid? && receiver.valid? && sender.balance > @amount
   end
   
   def execute_transaction
     if valid? && @status == 'pending'
        sender.withdrawl(amount)
        receiver.deposit(amount)
        # @last_transfer = @amount
        @status = 'complete'
        
     else
         @status = 'rejected'
        "Transaction rejected. Please check your account balance."
     end
   end
   
   def reverse_transfer
      if @status == 'complete'
        sender.deposit(amount)
        receiver.withdrawl(amount)
        @status = 'reversed'
      end
  end

end
