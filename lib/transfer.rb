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
    # If the sender's account is valid and the sender has enough money, transfer the money to the receiver's account. The transfer can only happen once. If the sender's account is invalid or the sender doesn't have enough money, reject the transaction.
    if sender.valid? && sender.balance > amount && self.status != "complete"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    elsif !sender.valid? || sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
