class Transfer
  attr_accessor :pending, :status
  attr_reader :sender, :receiver, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if (both_valid? && (sender.balance > amount) && status == "pending")
      sender.balance -= amount.to_i
      receiver.balance += amount.to_i
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance." 
  end

  def reverse_transfer
    if (both_valid? && (receiver.balance > amount) && status == "complete")
      sender.balance += amount.to_i
      receiver.balance -= amount.to_i
      self.status = "reversed"
    end
  end


end