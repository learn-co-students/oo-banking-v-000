class Transfer
  # your code here
  attr_reader :amount, :sender, :receiver
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @amount= amount
    @sender = sender
    @receiver = receiver
    @status= "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if valid? && @sender.balance > amount && @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status= "complete"
    else
      @status= "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if valid? && @receiver.balance > amount && @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status= "reversed"
    else
      @status= "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
end
