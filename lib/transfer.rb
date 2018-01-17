require 'pry'
class Transfer
attr_accessor :sender, :receiver, :status, :amount

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid?
  if @sender.valid? && @receiver.valid?
    true
  else
    false
  end
end

def execute_transaction

  if @status == "pending"
   @receiver.balance += amount
   @sender.balance -= amount
   @status = "complete"
 end
 #binding.pry
 if !@sender.valid?
   @status = "rejected"
   "Transaction rejected. Please check your account balance."
 end
end

def reverse_transfer
  if @status == "complete"
    @sender.balance += amount
    @receiver.balance -= amount
    @status = "reversed"
  end
end

end
