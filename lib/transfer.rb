require 'pry'
class Transfer

  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def successful_transfer
    @sender.balance -= amount
    @receiver.balance += amount
    self.status = "complete"
  end
  def rejected_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    self.valid? ? successful_transfer : rejected_transfer
  end

end
