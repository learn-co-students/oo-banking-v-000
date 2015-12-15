class Transfer
  attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender,receiver,amount)
    @amount=amount
    @sender=sender
    @receiver=receiver
    @status="pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && self.status=="pending" && sender.balance>=amount
      self.sender.balance -=amount
      self.receiver.balance+=amount
      self.status="complete"
    else
      self.reject_transfer
    end
  end

  def reject_transfer
   self.status="rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status=="complete"
      self.sender.balance +=amount
      self.receiver.balance-=amount
      self.status="reversed"
    end
  end
end