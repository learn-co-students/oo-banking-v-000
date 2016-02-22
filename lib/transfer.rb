class Transfer
  # code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender = @sender
    receiver = @receiver
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && @status == "pending" && @sender.balance > @amount
      self.receiver.balance += @amount
      self.sender.balance -= @amount
      self.status = "complete"
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      self.receiver.balance -= @amount
      self.sender.balance += @amount
      self.status = "reversed"
    end
  end
end