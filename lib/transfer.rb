class Transfer
  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid? && sender.balance > amount
  end

  def execute_transaction
    if both_valid? == true && self.status == "pending"
      sender.balance = sender.balance - amount 
      receiver.balance = receiver.balance + amount
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
    if self.status == "complete" 
      receiver.balance = receiver.balance - amount
      sender.balance = sender.balance + amount
      self.status = "reversed"
    end
  end
  # code here
end