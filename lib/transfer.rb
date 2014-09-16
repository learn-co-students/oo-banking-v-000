class Transfer
  attr_reader :transfer_amount, :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, transfer_amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @transfer_amount = transfer_amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && sender.balance > transfer_amount && self.status == "pending"
      sender.balance -= transfer_amount
      receiver.balance += transfer_amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if both_valid? && receiver.balance > transfer_amount && self.status == "complete"
      receiver.balance -= transfer_amount
      sender.balance += transfer_amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end