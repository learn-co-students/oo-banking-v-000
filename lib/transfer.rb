class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
end

def valid?
  sender.valid? && receiver.valid?
end

def execute_transaction
    if self.valid? && self.status == "pending" && sender.balance > amount
      receiver.balance += self.amount
      sender.balance -= self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.valid? && self.status == "complete" && receiver.balance > amount
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
      end
    end
  end
