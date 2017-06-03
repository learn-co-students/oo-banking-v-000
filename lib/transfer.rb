class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.valid? && self.status == "pending" && sender.balance > self.amount
      sender.withdraw(amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.withdraw(amount)
      sender.deposit(amount)
      self.status = "reversed"
    end
  end

end
