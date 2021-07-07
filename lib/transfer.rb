class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  attr_reader :balance
  
  
def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = 'pending'
end 

def valid?
  if @sender.valid? && @receiver.valid? && @sender.balance >= @amount
    return true
  else
    false
end 
end

def execute_transaction
  if self.valid? && @status == 'pending'
    @receiver.deposit(@amount)
    @sender.balance = @sender.balance - @amount
    @status = 'complete'
  else
   @status = 'rejected'
  return "Transaction rejected. Please check your account balance."
end 
end

def reverse_transfer
  if @status == 'complete'
    @receiver.balance = @receiver.balance - self.amount
    @sender.balance = @sender.balance + self.amount
  end 
    @status = 'reversed'
end 

end 