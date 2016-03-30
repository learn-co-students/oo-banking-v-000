class Transfer
  attr_accessor :status, :sender, :receiver, :amount, :last_transacion

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = "pending"
  end

  def both_valid?    
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
     if self.both_valid? && self.sender.balance > self.amount && self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    if !self.sender.valid? || self.sender.balance < self.amount
      self.status = "rejected" 
      "Transaction rejected. Please check your account balance." 
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed" 
    else
      
    end
  end


end