class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if sender.valid? == true && receiver.valid? == true && sender.balance > amount 
      true
    else
      false 
    end
  end
  
  def execute_transaction
    #binding.pry
    if self.status == "pending" && self.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
      elsif self.status == "pending" && self.valid? == true
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end
end
