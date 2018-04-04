require 'pry'
class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver 
  @status = 'pending'
  @amount = amount
  end
  
  def valid?
    @sender.valid?
    @receiver.valid?
  end
  
  def execute_transaction
    if @sender.balance < @amount
      self.status = "rejected"
    "Transaction rejected. Please check your account balance."
    else @sender.valid? == true
    until self.status == "complete"
    sender_balance = @sender.balance 
    receiver_balance = @receiver.balance 
    sender_change = sender_balance - @amount 
    receiver_change = receiver_balance + @amount
    @sender.balance = sender_change 
    @receiver.balance = receiver_change
    self.status = "complete"
  end
    
  end
end

def reverse_transfer
  if self.status == "complete"
  reverse_sender = @sender.balance + @amount 
  reverse_receiver = @receiver.balance - @amount
  @sender.balance = reverse_sender
  @receiver.balance = reverse_receiver
  self.status = "reversed"
end
end
  
end
