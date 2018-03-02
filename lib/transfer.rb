class Transfer

attr_accessor :transfer, :sender, :status, :receiver, :amount

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @status = "pending"
    @receiver = receiver
  end

  def valid?
    if receiver.valid? && sender.valid?
      return true
    end
  end

  def execute_transaction
    if self.status == "pending"
      if sender.valid? && sender.balance > @amount
          sender.balance = sender.balance - @amount
          receiver.balance = receiver.balance + @amount
          self.status = "complete"
      else
          self.status = "rejected"
          return "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
      if self.status == "complete"
        sender.balance = sender.balance + @amount
        receiver.balance = receiver.balance - @amount
        self.status = "reversed"
    end
  end



end
