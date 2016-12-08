class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if sender.balance < @amount || !sender.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
      receiver.balance += @amount 
      sender.balance -= @amount
      @status = "complete" 
    end
  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance -= @amount
      sender.balance += @amount
      @status = "reversed"
    else
      "Transfer cannot be reversed."
    end
  end
end
