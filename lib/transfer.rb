class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize (namefrom, nameto, amount)
   @sender = namefrom
   @receiver = nameto
   @amount = amount
   @status = 'pending'
  end
  
  def valid? 
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    else
    end
  end

end
