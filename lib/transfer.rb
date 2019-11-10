class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

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
    if sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending"
      sender.balance -= amount
      receiver.deposit(amount)
      self.status = "complete"
    end
  end

  def reverse_transfer
    if receiver.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "complete"
      receiver.balance -= amount
      sender.deposit(amount)
      self.status = "reversed"
    end
  end
end
