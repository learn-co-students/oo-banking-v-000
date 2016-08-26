require 'pry'

class Transfer
  attr_accessor :receiver, :status, :amount
  attr_reader :sender

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if sender.valid? && @status == "pending" && sender.balance - amount >= 0
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if sender.valid? && @status == "complete" && receiver.balance - amount >= 0
    sender.balance = sender.balance + amount
    receiver.balance = receiver.balance - amount
    @status = "reversed"
    else
    end
  end
end
