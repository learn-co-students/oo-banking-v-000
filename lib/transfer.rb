class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
  self.sender.valid? && self.receiver.valid? ? true : false
  self.sender.balance >= self.amount

  end

  def execute_transaction
    if self.status == "pending" && self.valid?
      self.sender.send(self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.send(self.amount)
      self.status = "reversed"
    end
  end

end  #  End of Class
