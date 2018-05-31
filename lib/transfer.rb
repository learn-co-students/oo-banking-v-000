class Transfer
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  attr_reader :sender, :receiver
  
  attr_accessor :amount, :status

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.valid? && @amount <= @sender.balance && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if valid? && execute_transaction == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status == "reversed"
    end
  end
end
