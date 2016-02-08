require 'pry'

class Transfer
  attr_accessor :status, :amount, :last_transfer
  attr_reader :sender, :receiver, :count

  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && status == 'pending' && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    elsif status == 'complete'
      # do nothing.  prevents repeating the same transfer twice.
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    end
  end
end
