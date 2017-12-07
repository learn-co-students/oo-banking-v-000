class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid? || sender.valid? || receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    #can execute a successful transaction between two accounts
    #status = "complete"
        #@receiver.balance - amount
        #sender.balance = sender.balance - amount
        #receiver.balance = receiver.balance + amount
        #if  sender.balance
        #   status == "complete"
        #elsif receiver.balance
        #    status == "complete"
        #else !!(sender.valid?)
        #   return "Transaction rejected. Please check your account balance."
        #end
        #sender.balance = @sender.deposit(@amount * -1 )
        #receiver.balance = @receiver.deposit(@amount)
        if @sender.balance < @amount
          @status = "rejected"
          return "Transaction rejected. Please check your account balance."
        elsif
          @status == "complete"
        else
          @sender.deposit(@amount * -1)
          @receiver.deposit(@amount)
          @status = "complete"
        end
  end

  def reverse_transfer
    if @status == "complete"
        @sender.deposit(@amount)
        @receiver.deposit(@amount * -1)
        @status = "reversed"
    end
   end
end
