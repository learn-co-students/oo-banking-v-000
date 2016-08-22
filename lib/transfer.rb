class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    (sender.valid? && receiver.valid?) ? true : false
  end

  def execute_transaction
    if self.valid? && self.amount <= sender.balance
      if self.status != "complete"
        sender.balance -= self.amount
        receiver.balance += self.amount
        self.status = "complete"
      end
    else
        self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" 
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
