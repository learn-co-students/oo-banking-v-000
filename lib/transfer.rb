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

  @@all_transactions = []

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def successful_transfer
    @sender.balance -= amount
    @receiver.balance += amount
    @status = "complete"
  end
  def rejected_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    self.valid? ? successful_transfer : rejected_transfer
  end

end
