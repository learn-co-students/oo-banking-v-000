class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount, @status = sender, receiver, amount, "pending"
  end

  def valid?
    self.sender.valid? && self.sender.balance >= self.amount &&
    self.receiver.valid? && self.status == "pending" ? true : false
  end

  def execute_transaction
    if self.valid?
      self.sender.balance -= self.amount
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      to_reverse = Transfer.new(self.receiver, self.sender, self.amount)
      to_reverse.execute_transaction
      self.status = "reversed"
    else
      nil
    end
  end

end
