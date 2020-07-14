class Transfer


attr_accessor :sender, :receiver, :status, :amount

def initialize(sender, receiver, transfer)
  @sender = sender
  @receiver = receiver
  @amount = transfer
  @status = "pending"
  @broke = 0
  @closed = "closed"
end

def valid?
  @sender.valid? && @receiver.valid?
end

def execute_transaction
  if @status == "pending"
    if @sender.balance >= @amount
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end

end
