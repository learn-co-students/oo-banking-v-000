class Transfer
  attr_accessor :bankaccount, :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending" && sender.status == "open"
        @receiver.balance += @amount
        @sender.balance -= @amount
        @status = "complete"
    else
      reject_transaction
    end
  end

  def reverse_transfer
    if valid? && @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    else
      reject_transaction
    end
  end

  def reject_transaction
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end



end
