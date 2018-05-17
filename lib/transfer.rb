class Transfer

  attr_accessor :receiver, :sender, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      false
    end
  end

  def execute_transaction
    if valid? && @status == "pending" && sender.balance > amount
    sender.balance -= amount
    receiver.balance += amount
    @status = "complete"
  else sender.balance < amount
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if valid? && @status == "complete" && sender.balance > amount
    receiver.balance -= amount
    sender.balance += amount
    @status = "reversed"
  else
  end
end


end
