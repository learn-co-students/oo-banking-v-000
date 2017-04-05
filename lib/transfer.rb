class Transfer
  attr_reader :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance >self.amount
  end

  def execute_transaction
    if(self.status != "pending")
    elsif !self.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      receiver.deposit(amount)
      sender.deposit(-amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status=="complete"
      @status = "pending"
      @amount = -@amount
      execute_transaction
      @status = "reversed"
    end
  end
  
end
