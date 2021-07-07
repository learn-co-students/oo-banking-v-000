class Transfer
  # your code here
  attr_accessor :transfer, :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount, transfer = nil)
    @sender = sender
    @receiver = receiver
    @transfer = transfer
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true && sender.balance >= @amount
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? == true && @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
        return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
    @status = "reversed"  
    end
  end

end
