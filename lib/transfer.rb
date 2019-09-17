require 'pry'
class Transfer

  attr_accessor :transfer, :sender, :receiver, :status, :amount

  attr_reader

  def initialize ( sender, receiver, transfer)
    self.sender = sender
    self.receiver = receiver
    self.status = "pending"
    self.amount = transfer
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance >= self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.execute_transaction
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
