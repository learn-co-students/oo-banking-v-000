require 'pry'
class Transfer
attr_reader :receiver, :sender, :amount, :status

def initialize(sender,receiver,amount)
  @receiver = receiver
  @sender = sender
  @amount = amount
  @status = "pending"
end

def valid?
  if sender.balance > amount && sender.valid? == true && receiver.valid? == true
    true
  else
    false
  end
end

def execute_transaction
  if self.valid? == false
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  elsif @status == "pending" && self.valid? == true
    receiver.deposit(amount)
    sender.withdraw(amount)
    @status = "complete"
  end
end

def reverse_transfer
  if @status != "complete"
    return "You have to compleate the transfer first to reverse it"
  else
    receiver.withdraw(amount)
    sender.deposit(amount)
    @status = "reversed"
  end
end

end
