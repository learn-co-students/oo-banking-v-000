require 'pry'
class Transfer
attr_accessor :status, :sender, :receiver, :amount  

def initialize(sender,receiver,amount)
  @sender=sender
  @receiver=receiver
  @amount=amount
  @status= "pending"
end
def both_valid?
  if sender.valid? && receiver.valid?
    true
  else
    false
  end
end

def execute_transaction
  reject_transfer
 if @status=="pending"
  sender.balance-= amount
  receiver.balance+= amount
  @status="complete"
elsif @status="rejected"
  "Transaction rejected. Please check your account balance."
end
end

def reject_transfer
  if sender.balance< amount
    @status="rejected"
  end
end

def reverse_transfer
  if @status=="complete"
    sender.balance+= amount
  receiver.balance-= amount
  @status="reversed"
end
end


end