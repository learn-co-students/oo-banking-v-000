require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :times

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @times = 0
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    return if self.times == 1
    if amount > sender.balance
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    self.sender.balance -= self.amount
    self.receiver.balance += self.amount
    self.status = "complete"
    self.times += 1   
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end  
end