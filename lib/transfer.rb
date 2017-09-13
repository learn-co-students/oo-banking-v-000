
class Transfer
#They can be executed and go to a "complete" state. They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.

  attr_accessor :status, :sender, :receiver, :amount

   def initialize(sender, receiver, amount)
      @status = "pending"
      @sender = sender
      @receiver = receiver
      @amount = amount
   end

    def valid?  #both accounts are valid
      @sender.valid? && @receiver.valid?
    end

    def execute_transaction #transfer only once, rejects if invalid acct, can transfer betw 2 if valid
      if status == "pending" && valid? && amount <= sender.balance
          sender.balance -= amount
          receiver.balance += amount
          self.status = "complete"
      else
        self.status = "rejected"
         "Transaction rejected. Please check your account balance."
      end
    end

  def reverse_transfer
      if status == "complete" && valid? && amount <= receiver.balance
          receiver.balance -= amount
          sender.balance += amount
          self.status = "reversed"
        # if rec has enuf $
        #   if accts r valid?
        #     amount from receive
        #     add amount sender
        #
    #can reverse a transfer betw two accounts
    #it can only reverse executed Transfers
      end
  end

end
