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
    if sender.valid? && sender.balance > amount
      if self.status != "complete" && self.status != "reversed" && self.status != "rejected"
        sender.deposit(-amount)
        receiver.deposit(amount)
        self.status = "complete"
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status != "pending"
      sender.deposit(amount)
      receiver.deposit(-amount)
      self.status = "reversed"
    end
  end
end
