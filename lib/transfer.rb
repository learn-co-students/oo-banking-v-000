require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount = 50, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    # binding.pry
    self.receiver.valid? && self.sender.valid?
  end

  def execute_transaction
    if status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      if valid? == false
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        self.status = "complete"
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
