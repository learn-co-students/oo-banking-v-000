class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status != "complete" && sender.balance > self.amount
      sender.withdrawal(self.amount)
      receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      result = "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status = "complete"
      sender.deposit(self.amount)
      receiver.withdrawal(self.amount)
      self.status = "reversed"
    else
      self.status = "rejected"
    end
  end

end
