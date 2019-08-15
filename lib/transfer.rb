class Transfer

attr_accessor :sender, :receiver, :amount
attr_reader :status

def initialize(sender, receiver, amount)
 @amount = amount
 @sender = sender
 @receiver = receiver
 @status = "pending"
end


end
