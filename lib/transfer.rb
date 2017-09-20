class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && sender.balance > self.amount && self.status == "pending"
      self.receiver.deposit(+self.amount)
      self.sender.deposit(-self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
   if self.status == "complete"
     self.sender.deposit(+self.amount)
     self.receiver.deposit(-self.amount)
     self.status = "reversed"
   end
 end

end
