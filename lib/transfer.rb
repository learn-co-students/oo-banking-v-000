class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end 

  def execute_transaction
    if sender.balance > amount && self.status == "pending" && self.valid?
      sender.balance -= amount 
      receiver.balance += amount 
      @status =  "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 

  def reverse_transfer 
    if self.status == "complete" && self.valid?
      receiver.balance -= amount 
      sender.balance += amount 
      @status =  "reversed"
    end
  end 

  
end
