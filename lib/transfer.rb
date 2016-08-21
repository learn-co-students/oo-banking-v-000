class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? == true && self.status == "pending" && @sender.balance > amount
      @sender.balance -= amount
      @receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
       "Transaction #{self.status}. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" && @receiver.balance > amount
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

end
