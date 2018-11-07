class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(account_one, account_two, amount)
    self.sender = account_one
    self.receiver = account_two
    self.amount = amount
    self.status = "pending"
  end

  def valid?
    true if self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && status == "pending" && self.sender.balance > self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end



end
