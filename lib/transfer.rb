class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
      sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if sender.balance > amount
      if valid? && @status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      else 
        @status = "rejected"
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end      
  end
  
  def reverse_transfer
    if @status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end
  end
  
end
