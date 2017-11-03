require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if (self.sender.valid? && self.receiver.valid?)
      true
    else
      false
    end
  end

  def execute_transaction
    if (valid? && sender.balance > amount && self.status != 'complete')
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if (valid? && receiver.balance > amount && self.status == 'complete')
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      self.status = 'reversed'
    end
  end

end
