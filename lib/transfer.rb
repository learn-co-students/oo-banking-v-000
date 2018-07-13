require 'pry'
class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  
  def valid?
    if self.sender.valid? && self.receiver.valid?
      true 
    else 
      false
    end
  end
  
  def execute_transaction
    if self.status == 'pending' && sender.balance >= self.amount
       sender.balance -= self.amount
       receiver.balance += self.amount
       self.status = 'complete'
    else
      self.status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end 
  
  def reverse_transfer
    if self.status == 'complete'
       sender.balance += self.amount
       receiver.balance -= self.amount
       self.status = 'reversed'
    end
  end
end
