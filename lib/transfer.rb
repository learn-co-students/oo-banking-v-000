class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def successful_transaction
    if self.valid? && sender.balance > amount && self.status == "pending" #make sure the sender has enough money to send!
      sender.balance = sender.deposit(-amount)
      receiver.balance = receiver.deposit(amount)
      self.status = "complete"
    end
  end

  def failed_transaction
    if !self.valid? || sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def execute_transaction
    self.successful_transaction || self.failed_transaction
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance = sender.deposit(amount)
      receiver.balance = receiver.deposit(-amount)
      self.status = "reversed"
    end
  end

end
