class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid? && sender.balance > amount
      true
    else
      false
    end
  end

  def execute_transaction
    if @status != "complete"
     if valid?
       sender.deposit(@amount * -1)
       receiver.deposit(@amount)
       @status = "complete"
    else
      @status = "rejected"
     "Transaction rejected. Please check your account balance."
    end
   end
  end

  def reverse_transfer
    if @status == "complete"
      receiver.deposit(@amount * -1)
      sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
