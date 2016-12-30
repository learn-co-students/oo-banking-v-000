require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  attr_reader :balance

  def initialize(sender, receiver, amount=0)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @amount < sender.balance && self.status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else sender.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction
      receiver.balance -= @amount
      sender.balance += @amount
      self.status = "reversed"
    end
  end

end
