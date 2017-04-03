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
    if !sender.valid? || amount > sender.balance
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status != "complete" && sender.valid?
      sender.balance-= amount
      receiver.balance+= amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status != "pending"
      sender.balance+= amount
      receiver.balance-= amount
      self.status = "reversed"
    end
  end

end
