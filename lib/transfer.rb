class Transfer
  attr_reader :sender, :receiver, :amount, :status
  
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def execute_transaction
    if valid? && sender.balance>=amount && status=="pending"
      sender.withdraw(amount)
      receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if status=="complete"
      sender.deposit(amount)
      receiver.withdraw(amount)
      @status = "reversed"
    end
  end
  
  def valid?
    sender.valid? && receiver.valid? ? true : false
  end
  
end