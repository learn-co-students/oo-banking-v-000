class Transfer
  attr_accessor :status, :sender, :receiver
  attr_reader  :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if status == "pending" && valid? && sender.balance >= amount
      sender.withdrawal(amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      receiver.withdrawal(amount)
      sender.deposit(amount)
      self.status = "reversed"
    end
  end
end
