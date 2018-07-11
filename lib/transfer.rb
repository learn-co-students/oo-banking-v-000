class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, transfer_amount)
    @status = "pending"
    @amount = transfer_amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && self.status == "pending" && self.amount < @sender.balance
      receiver.deposit(self.amount)
      sender.balance -= self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @sender.valid? && self.status == "complete"
    sender.deposit(self.amount)
    receiver.balance -= self.amount
    self.status = "reversed"
  else
    "Transaction rejected. Please check your account balance."
  end
  end
end
