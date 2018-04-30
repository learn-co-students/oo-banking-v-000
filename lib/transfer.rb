require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? == true and @receiver.valid? == true and @sender.balance >= @amount
      true
    else
      false
    end
  end

  def execute_transaction
    if self.status == "pending" and self.valid? == true
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      sender.balance.freeze
      receiver.balance.freeze
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
