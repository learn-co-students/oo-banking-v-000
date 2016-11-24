class Transfer
  attr_accessor :from, :to, :amount, :status
  def initialize(from, to, amount)
    @from = from
    @to = to
    @amount = amount
    @status = "pending"
  end
  def sender
    self.from
  end
  def receiver
    self.to
  end
  def valid?
    self.to.valid? && self.from.valid?
  end

  # if valid? && sender.balance > amount && self.status == "pending"

  def execute_transaction
    if self.status == "pending" && valid? && sender.balance > amount
      self.from.balance -= self.amount
      self.to.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
