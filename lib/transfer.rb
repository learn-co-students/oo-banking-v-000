class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
  def valid? 
    sender.valid? && sender.balance > amount && receiver.valid?
  end 
  
  def execute_transaction
    if valid? == true && self.status == "pending"
      sender.balance = sender.balance - amount 
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else 
      self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
    if self.status == "complete"
      sender.balance = sender.balance + amount 
      receiver.balance = receiver.balance - amount
      self.status = "reversed" 
    end
  end
end