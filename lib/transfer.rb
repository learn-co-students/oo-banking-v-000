require 'pry'
class Transfer
attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender,receiver,amount)
#binding.pry
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
end

def valid?
#if(@sender.status == "open" && @receiver.status == "open" && @sender.balance >= @amount)
if(@sender.valid? && @receiver.valid?)
true
else
  false
end
end

def execute_transaction
  if(@sender.valid? && @receiver.valid?)
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    exit
  end
    

end
end
