class Transfer
    attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance >= amount
        if self.status !="complete"
            sender.balance = (sender.balance - amount)
            receiver.balance = (receiver.balance + amount)
            self.status = "complete"
        end
    else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
        sender.balance = (sender.balance + amount)
        receiver.balance = (receiver.balance - amount)
        self.status = "reversed"
    end
  end

end
