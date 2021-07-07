require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender   = sender
    @receiver = receiver
    @amount   = amount
    @status   = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status != 'complete' && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete' && receiver.balance > amount
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    end
  end
end
