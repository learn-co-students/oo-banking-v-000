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
    #binding.pry
    if self.amount < sender.balance && self.status == 'pending'
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    end
  end

end