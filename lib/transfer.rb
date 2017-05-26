class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status
  # your code here

 def initialize(sender, receiver, amount)
@amount= amount
@sender = sender
@receiver = receiver
@status = 'pending'
 end

def valid?
@sender.valid? && @receiver.valid?
end

def execute_transaction
if sender.valid? && status == 'pending' && sender.balance >= amount
exchange_money(receiver, sender)
@status = 'complete'
else
  @status = 'rejected'
 "Transaction rejected. Please check your account balance."
end
end

def reverse_transfer
  if status == 'complete'
 exchange_money(sender, receiver)
 @status = 'reversed'
  end
end

private
def exchange_money(v1, v2)
  v1.deposit(amount)
  v2.balance -= amount
end


end
