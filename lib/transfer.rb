require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  attr_reader

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    receiver.valid? && sender.valid? ? true : false
  end

  def execute_transaction
    if sender.balance < amount 
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif self.status != "complete" 
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
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
