class Transfer

attr_accessor :sender, :receiver, :status, :amount

def initialize(sender, receiver, amount)
@sender = sender
@receiver = receiver
@amount = amount
@status = "pending"
end

def both_valid?

if self.sender.valid? == true && self.receiver.valid? == true
  true
else
  false
end
end


def execute_transaction

if self.both_valid? == true && sender.balance > amount && self.status != "complete"
self.receiver.deposit(amount)
sender.balance = sender.balance - amount
self.status = "complete"  

else
self.status = "rejected"
return "Transaction rejected. Please check your account balance."
end
end


def reverse_transfer

if self.status == "complete" 
  self.receiver.balance = self.receiver.balance - amount
  sender.balance = sender.balance + amount
  self.status = "reversed"
else
end
end



##if sender isnt valid then status = "rejected" and the method returns that string











end