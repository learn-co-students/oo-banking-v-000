class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && sender.balance >= self.amount && receiver.valid?
  end
  
  def precheck
    if @status == "pending" && valid?
      self.status = "ready"
    elsif !valid?
      self.status = "rejected"
    end
  end

  def execute_transaction
    precheck

    if self.status == "complete"
      "Transaction already completed."
    elsif self.status == "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "ready"
      @sender.withdraw(amount)
      @receiver.deposit(amount)
      @status = "complete"
    else
      "Unknown error."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.withdraw(amount)
      @sender.deposit(amount)
      @status = "reversed"
    else
      "Reverse transfer failed."
    end
  end
end
