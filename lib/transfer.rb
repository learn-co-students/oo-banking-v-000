class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount, status = "pending")
    @sender  = sender
    @receiver = receiver
    @amount = amount
    @status = status
end

def valid?
 return  self.status == "pending" && sender.valid? == true && receiver.valid? == true
end

def execute_transaction
  if @status !="complete"
    if @sender.balance >= @amount
         @sender.balance -= @amount
         @receiver.balance += @amount
         @status= "complete"
     else
         msg="Transaction rejected. Please check your account balance."
         @status="rejected"
     end
   end
  msg
end

def reverse_transfer
  if status == "complete"
         @receiver.balance -= @amount
         @sender.balance += @amount
         @status= "reversed"
   end
end
end
