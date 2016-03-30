require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :amount , :status

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
    if self.status.eql?("pending") && self.sender.valid?
      self.sender.balance -= @amount
      self.receiver.balance += @amount
    end
    self.status = "complete"
    if !self.sender.valid?
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status.eql?("complete")
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
    end
    self.status = "reversed"
  end
    


end