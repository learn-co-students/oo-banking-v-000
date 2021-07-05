require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :bankaccount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if self.status == "pending" 
      sender.balance -= amount
      receiver.balance += amount
        self.status = "complete"
      end
    if sender.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
      end
    end
  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
        self.status ="reversed"
    end
  end


end
