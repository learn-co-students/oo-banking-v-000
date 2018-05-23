require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status
  attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance >= self.amount
      self.sender.deposit(-(self.amount))
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.deposit(-(self.amount))
      self.status = "reversed"
    else
      "Reverse transfer failed."
    end
  end

end
