class Transfer
  # code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
  end

  def both_valid?
    sender.valid? && receiver.valid? ? true : false

  end

  def execute_transaction
    if sender.balance > amount && @status!="complete"
      sender.balance -= amount
      receiver.balance += amount
  @status="complete"
else
  reject_transfer
    end
  end

  def reject_transfer
    @status="rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
   if execute_transaction
     sender.balance += amount
     receiver.balance -= amount
     @status="reversed"
   end
 end


end
