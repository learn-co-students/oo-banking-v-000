require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  attr_reader :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    sender.valid? == true && receiver.valid? == true
  end

  def execute_transaction
    if self.valid? && (sender.balance >= @amount) && self.status == 'pending'
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && (receiver.balance >= @amount) && self.status == 'complete'
      sender.balance += @amount
      receiver.balance -= @amount
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end


  end

end
