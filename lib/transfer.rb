require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  TRANSFERS = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if TRANSFERS.include? self
      return
    elsif self.valid? && self.sender.balance >= self.amount
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
      TRANSFERS << self
    else
      self.status = "rejected"
      # binding.pry
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if TRANSFERS.include? self
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
