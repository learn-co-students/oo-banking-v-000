require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status ='pending'
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    self.sender.balance -=self.amount
    if self.sender.valid? && self.status == "pending"
    self.receiver.balance += self.amount
    self.status = "complete"
    else
    self.sender.balance +=self.amount
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
    if self.status == "complete"
    self.sender.balance += amount
    self.receiver.balance -= amount
    self.status = "reversed"
    end
  end

end
