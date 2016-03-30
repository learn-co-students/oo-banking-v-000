class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status == "pending"
      if both_valid? && self.amount <= self.sender.balance
        self.sender.deposit(-self.amount)
        self.receiver.deposit(self.amount)
        self.status = "complete"
      else
        self.status = "rejected"
        reject_transfer
      end
    end
  end

  def reject_transfer
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      Transfer.new(self.receiver, self.sender, self.amount).execute_transaction
      self.status = "reversed"
    end
  end

end