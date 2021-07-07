class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid? == true
      true
    else
      false
  end
  end

  def execute_transaction
    if amount > sender.balance
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
      define_singleton_method(:execute_transaction) {}
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
    end
    self.status = "reversed"
  end
end
