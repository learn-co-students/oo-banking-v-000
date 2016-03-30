class Transfer
  attr_accessor :sender, :receiver, :status
  attr_reader :amount

  def initialize(from, to, amount)
    @sender = from
    @receiver = to
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.reject_transfer == true
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending"
      self.make_transfer
    end
  end

  def make_transfer
      self.sender.withdraw(self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
  end

  def reject_transfer
    self.both_valid? != true || self.sender.balance < self.amount
  end

  def reverse_transfer
    while self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.withdraw(self.amount)
      self.status = "reversed"
    end
  end
end