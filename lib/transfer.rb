require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid? 
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    unless status == "complete"
      sender.balance -= amount #@sender.balance = @sender.balance - @amount
      receiver.balance += amount
      self.status = "complete"
    end
      # transfer happening once
      #rejects a transfer if sender !valid
    if sender.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      self.status = "reversed"
    end
  end
  
end
