class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if !valid? || self.sender.balance < amount || self.status == "complete"
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      self.sender.deposit(-amount)
      self.receiver.deposit(amount)
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.status = "reversed"
      self.sender.deposit(amount)
      self.receiver.deposit(-amount)
    end
  end
end
