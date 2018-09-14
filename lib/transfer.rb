class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  @@transfers = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@transfers << self
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.reject_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end
end
