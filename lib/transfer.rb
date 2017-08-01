class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && @sender.balance >= self.amount && self.status == "pending"
      @receiver.balance += self.amount
      @sender.balance -= self.amount
      self.status = "complete"
    else self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && self.status == "complete"
      @receiver.balance -= self.amount
      @sender.balance += self.amount
      @status = "reversed"
    end
  end
end
