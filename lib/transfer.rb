class Transfer
  
  attr_accessor :transfer, :sender, :receiver, :status, :amount, :bank_account

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid? == true
  end

  def execute_transaction
    if self.valid? && (sender.balance >= self.amount) && self.status == "pending"
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.execute_transaction
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end
  end

end #<-- end class -->