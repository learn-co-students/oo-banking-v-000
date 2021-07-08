class Transfer
  attr_accessor :sender, :receiver, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def status
    @status
  end

  def amount
    @amount
  end

  def valid?
    if self.receiver.valid? && self.sender.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    # binding.pry
    if self.status == "pending" && @amount <= self.sender.balance #self.amount <= self.sender.balance #&& self.amount <= self.sender.balance
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    else

    end

  end

  def status=(status)
    @status = status
  end

end
