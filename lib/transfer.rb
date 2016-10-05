class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > amount
  end

  def execute_transaction
    if self.valid? && self.status != "complete"
      @sender.balance -= amount
      @receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      self.status = "reversed"
    else
      "Transfer not eligible to be reversed. Please review transaction details."
    end
  end
end
