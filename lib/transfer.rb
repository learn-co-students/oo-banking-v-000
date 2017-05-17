class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender= sender
    @receiver= receiver
    @status = "pending"
    @amount= amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    end
  end

  def execute_transaction
    valid? 
    if sender.balance > amount && self.status == "pending"
      @sender.balance= self.sender.balance - amount
      @receiver.balance= self.receiver.balance + amount
      self.status= "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if  valid? && receiver.balance > amount && self.status == "complete"
      @sender.balance= self.sender.balance + amount
      @receiver.balance= self.receiver.balance - amount
      self.status= "reversed"
    end
  end
end
