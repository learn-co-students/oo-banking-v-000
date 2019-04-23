require 'pry'

class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
  def valid?
    @sender.valid? && receiver.valid?
  end 
  
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else sender.balance <= 0 && self.status = "open"
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    end
  end
  
  
end
