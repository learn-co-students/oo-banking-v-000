require "pry"
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @amount = transfer_amount
    
    @status = "pending"
  end
  
  def valid? # Arguably, this ought to return true even if the receiver has no money at all.
    self.sender.valid? && self.receiver.valid? && self.amount <= self.sender.balance
  end 
  
  def execute_transaction
    if !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending"
      sender.balance -= self.amount 
      receiver.deposit(self.amount)
      self.status = "complete"
    else 
      "Transaction has already been completed or rejected. Please make a new transfer."
    end
  end 
  
  def reverse_transfer
    #binding.pry
    if self.status == "complete" # A transfer has occurred.
      self.class.new(self.receiver, self.sender, self.amount).execute_transaction 
      self.status = "reversed"
    else # No transfer has occurred yet, and therefore cannot be reversed.
      "Error. There is no transfer to be reversed, or transfer has already been reversed."
    end
    #binding.pry
  end
end
binding.pry
