require 'pry'
class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount.to_i
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? && self.status == "pending" && sender.balance > self.amount
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
    # binding.pry
  end
end
