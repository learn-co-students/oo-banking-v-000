require 'pry'
class Transfer
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  attr_accessor :sender, :receiver, :status, :amount
                :previous_transfer
  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction # status to complete or rejected
    if self.sender.valid? && self.sender.balance > self.amount && self.status == "pending"
      self.sender.deposit(self.amount*-1)
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      #binding.pry
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer # status to reverse
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.deposit(self.amount*-1)
      self.status = "reversed"
    end
  end
end
