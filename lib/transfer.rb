require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid? ? true : false
  end
  
  def execute_transaction
    sender.balance -= amount
    receiver.balance += amount
    self.status = 'complete'
  end

  def reject_transfer
  end

  def reverse_transfer
  end
end