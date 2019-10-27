require 'pry'
class Transfer

  attr_accessor :status, :sender, :receiver, :amount, :counter

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
    @counter = 0
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if !sender.valid? || sender.balance < self.amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif self.status == "pending"
     sender.balance = sender.balance - self.amount
     receiver.balance = receiver.balance + self.amount
     self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance = sender.balance + self.amount
      receiver.balance = receiver.balance - self.amount
      self.status = "reversed"
    end
  end
end
