class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid?
    self.receiver.valid?
  end

  def execute_transaction
    if sender.valid? && self.status != "complete"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status == "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer

  end

end
