class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  #status can me: pendind, complete, rejected, or reversed

  #will check the validity of the accounts before transfer occurs
  #trasfer can reject the transfer if account isn't valid or has no $$

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    def sender_valid?
      self.sender.valid? && self.sender.balance >= amount
    end
    self.sender_valid? && self.receiver.valid? && self.status == "pending"
  end

  def execute_transaction
    if self.valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
