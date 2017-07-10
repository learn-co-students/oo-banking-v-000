class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  @@last_transaction = {:sender => [], :receiver => [], :amount => []}

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
    if sender.valid? && receiver.valid? && self.status == "pending" && sender.balance - self.amount > 0
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
      @@last_transaction = {:sender => [sender], :receiver => [receiver], :amount => [amount]}
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @@last_transaction[:sender].include?(sender) && @@last_transaction[:receiver].include?(receiver)
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end
