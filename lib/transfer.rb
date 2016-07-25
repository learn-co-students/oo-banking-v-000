class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.status == "pending" && self.valid? == true && self.sender.balance >= @amount
      self.sender.withdraw(@amount)
      self.receiver.deposit(@amount)
      @status = "complete"
    elsif self.status == "pending" && self.valid? == true && self.sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(@amount)
      self.receiver.withdraw(@amount)
      self.status = "reversed"
    end
  end

end
