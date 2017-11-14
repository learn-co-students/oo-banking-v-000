class Transfer
  attr_reader :sender, :receiver , :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def sender_valid_amount?
    valid? && sender.balance > amount && self.status == "pending"
  end

  def execute_transaction
    if sender_valid_amount?
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction #{self.status}. Please check your account balance."
    end
  end

  def reverse_transfer_valid?
    self.status == "complete"
  end

  def reverse_transfer
    if reverse_transfer_valid?
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction #{self.status}. Please check your account balance."
    end
  end
end
