require 'pry'
class Transfer
#this class will test the validity of bank accounts and then send back to another instance of bank account
attr_accessor :status, :amount, :bank_account
attr_reader  :sender, :receiver

def initialize(sender, receiver, amount)
  @sender= sender
  @receiver= receiver
  @status = "pending"
  @amount = amount
end

def valid?
   sender.valid? &&
   receiver.valid? &&
   amount <= sender.balance
#Has to see if sender.bank_account and receiver.bank_account are valid

end

def execute_transaction
  if valid? && @status == "pending"
  @sender.balance = @sender.balance - @amount
  @receiver.balance = @receiver.balance + @amount
  @status = "complete"
else
  self.status = "rejected"
  "Transaction rejected. Please check your account balance."
end
end

def reverse_transfer
   if @status == "complete"
     @sender.balance = @sender.balance + @amount
     @receiver.balance = @receiver.balance - @amount
     self.status = "reversed"
   end
end
end
