class Transfer
  # your code here
  attr_accessor :status, :receiver, :sender, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? == true && self.status == "pending" && sender.balance > amount
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
    receiver.balance -= amount
    sender.balance += amount
    self.status = "reversed"
  end
  end

end
