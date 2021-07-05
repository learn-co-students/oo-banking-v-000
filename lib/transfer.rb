require 'pry'
class Transfer
  # your code here
    attr_reader :sender, :receiver, :amount
    attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    self.status = "pending"
  end

  def valid?
    self.receiver.valid? && self.sender.valid?
  end

  def execute_transaction
    if self.sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif
      self.status == "complete"
      nil
    else
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
    else
      nil
    end
  end

end
