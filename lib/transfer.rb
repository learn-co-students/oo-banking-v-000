class Transfer
   attr_accessor  :sender, :receiver, :status
   attr_reader :amount
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
    if valid? && self.sender.balance >= @amount && self.status == "pending"
    @sender.withdraw(@amount)
    @receiver.deposit(@amount)
    @status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
    @sender.deposit(@amount)
    @receiver.withdraw(@amount)
    @status =  "reversed"
    end
  end

end
