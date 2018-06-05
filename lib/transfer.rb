class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? == true && @receiver.valid? == true ? true : false
  end
  
  def execute_transaction
    if @sender.valid? == true && @sender.balance > amount
      if self.status == "pending"
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
      else
        nil
      end
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status == "complete" 
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    else 
      nil
    end
  end
end
