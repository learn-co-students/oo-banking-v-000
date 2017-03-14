class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.status == "pending"
      if self.sender.balance >= self.amount
        if self.valid?
          self.sender.balance_for_transfer = self.sender.balance - self.amount
          self.receiver.balance_for_transfer = self.receiver.balance + self.amount
          self.status = "complete"
        else
          self.status = "rejected"
        end
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    elsif self.status == "complete"
      "This transaction has already been completed."
    else
      "This transaction is not valid."
      self.status = "rejected"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance_for_transfer = self.sender.balance + self.amount
      self.receiver.balance_for_transfer = self.receiver.balance - self.amount
      self.status = "reversed"
    else
      "This transaction cannot be reversed."
    end
  end

end
