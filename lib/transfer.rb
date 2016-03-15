class Transfer
  

  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def both_valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if both_valid? && status == "pending" && @sender.balance > amount       
      @receiver.deposit(amount)
      @sender.deposit(-amount)
      self.status = "complete"
    else @sender.balance < amount
      reject_transfer
    end
  end


  def reject_transfer 
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if both_valid? && receiver.balance > 0 && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end
end

