class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

    def initialize(sender, receiver, status = "pending", amount)
      @sender   = sender
      @receiver = receiver
      @status   = "pending"
      @amount = amount
    end

def valid?
   sender.valid? && receiver.valid?
end

def execute_transaction
  if status == "pending" && @sender.balance - @amount > 0
    @receiver.balance += @amount
    @sender.balance  -= @amount
    self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if status == "complete"
    @receiver.balance -= @amount
    @sender.balance  += @amount
    self.status = "reversed"
  else
  end
end



end
