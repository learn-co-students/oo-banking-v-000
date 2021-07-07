class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender,receiver,amount)
    @status="pending"
    @sender=sender
    @receiver=receiver
    @amount=amount
end
def valid?
  (@sender.valid? && @receiver.valid?)
end
def execute_transaction
 if (self.valid? && @amount<@sender.balance )
   if (self.status=="pending")


  @sender.balance-=@amount
  @receiver.deposit(@amount)
  @status="complete"
end

else
  @status="rejected"
  "Transaction rejected. Please check your account balance."
end
end
def reverse_transfer
  if self.status=="complete"
    @sender.balance+=@amount
    @receiver.balance-=@amount
    @status="reversed"
  end
end

end
