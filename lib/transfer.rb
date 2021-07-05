require 'pry'

class Transfer
  # @@completed_transactions = []
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? && self.status == "pending"
  end

  def execute_transaction
    if sender.balance < amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."

    elsif self.valid?
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
      # @@completed_transactions << self
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
      # @@completed_transactions << self
    end
  end
end
