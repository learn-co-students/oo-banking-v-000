class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    (@sender.valid? && @receiver.valid?)
  end

  def execute_transaction
    if self.valid?
      unless @status=="complete"
        if @sender.withdraw(@amount)
          @receiver.deposit(@amount)
          @status = "complete"
        else
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
        end
      end
    else
      "Invalid account."
    end
  end

  def reverse_transfer
    unless @status!="complete"
      if @receiver.withdraw(@amount)
        @sender.deposit(@amount)
        @status = "reversed"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

end
