require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid?
    self.receiver.valid?
  end

  def execute_transaction
    if self.sender.balance <= amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status != "complete"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      @status = "complete"
    end
  end

  def reverse_transfer
    unless self.status != "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      @status = "reversed"
    end
  end

end
