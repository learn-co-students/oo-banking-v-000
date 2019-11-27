
class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :balance

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
    if sender.valid? && sender.balance > amount && receiver.valid? && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if sender.valid? && receiver.valid? && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
    end

  end







end
