class Transfer

attr_accessor :sender, :receiver, :status, :BankAccount, :amount, :name

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
      sender.valid? && receiver.valid?
   end

   def execute_transaction
     if sender.valid?
       if sender.balance >= amount
         if @status != "complete"
         sender.balance -= amount
         receiver.balance += amount
         @status = "complete"
       end
      else
        @status = "rejected"
       "Transaction rejected. Please check your account balance."
      end
    end

   end

     def reverse_transfer
       if @status == "complete"
         sender.balance += amount
         receiver.balance -= amount
         @status = "reversed"
       end
     end


end
