class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

    def valid?
    @sender.valid? && @receiver.valid?
    end

    def execute_transaction
      if @status != "complete" && @sender.valid? && @receiver.valid? && @sender.balance >= @amount
        @receiver.balance = @receiver.balance + @amount
        @sender.balance = @sender.balance - @amount
        @status = "complete"
        return "abc"
      else
        @status = "rejected"
     return "Transaction rejected. Please check your account balance."
     end
  end

    def reverse_transfer
      if @status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end
end
