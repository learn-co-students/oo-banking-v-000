class Transfer

  attr_accessor :sender, :receiver, :amount, :status 
 
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount
    @status = "pending" 
  end

  def both_valid?
    if @sender.valid? && @receiver.valid?
      true
    else 
      false
    end 
  end

  def execute_transaction
    if both_valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status ="rejected"
    "Transaction rejected. Please check your account balance."
  end

  # def reverse_transfer
  #   if execute_transaction != reject_transfer 
  #     sender.balance += amount
  #     receiver.balance -= amount
  #   end 
  # end 

  def reverse_transfer
    if both_valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end 

end