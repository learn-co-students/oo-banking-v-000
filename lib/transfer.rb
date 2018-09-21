class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :last_transfer_amt

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @last_transfer_amt = 0
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance >= amount && status == "pending"
  end

  def execute_transaction
    if valid?
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.last_transfer_amt = amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    self.sender.balance += last_transfer_amt
    self.receiver.balance -= last_transfer_amt
    self.status = "reversed"
  end
end
