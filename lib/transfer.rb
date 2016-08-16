class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance >= self.amount
  end

  def execute_transaction
    if self.status != "complete" && self.valid?
      self.sender.balance -= amount
      self.receiver.deposit(amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      reverse = Transfer.new(self.receiver, self.sender, amount)
      reverse.execute_transaction
      self.status = "reversed"
    end
  end
end

