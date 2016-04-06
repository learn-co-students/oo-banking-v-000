class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if status != "complete" && both_valid? && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      reject_transaction
    end
  end

  def reject_transaction
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if status == "complete" && both_valid? && receiver.balance >= amount
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
end