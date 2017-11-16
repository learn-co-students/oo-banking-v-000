class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

def execute_transaction
  puts "Valid? #{@sender.valid?}: #{@sender.status}, #{@sender.balance}"
  puts "Valid? #{@receiver.valid?}: #{@receiver.status}, #{@receiver.balance}"
if @status=="pending" && @sender.valid? && @sender.balance>@amount
   @sender.deposit(-@amount)
   @receiver.deposit(@amount)
   @status="complete"
 else
   if !@sender.valid? ||  @sender.balance<@amount
    @status="rejected"
    "Transaction rejected. Please check your account balance."
  end
end
end

def  reverse_transfer
  if @status=="complete"
     @sender.deposit(@amount)
     @receiver.deposit(-@amount)
     @status="reversed"
   end
end

#end

end
