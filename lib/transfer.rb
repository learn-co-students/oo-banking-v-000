class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :bank_account

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount 
end 

def valid?
  if @sender.valid? && @receiver.valid?
    true
  else 
    false
  end 
end 

def execute_transaction
  if @sender.valid? && @status == "pending"
    @sender.withdraw(amount)
    @receiver.deposit(amount) 
    @status = "complete"
  end 
  if @sender.valid? == false
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end 
end 

def reverse_transfer
  if @status == "complete"
    @receiver.withdraw(amount)
    @sender.deposit(amount)
    @status = "reversed"
  end 
end 
  
end
