class Transfer
  attr_reader :status, :sender, :receiver, :amount
  # your code here
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance = sender.balance - @amount
      receiver.balance = receiver.balance + @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && amount < receiver.balance && self.status == "complete"
      sender.balance = sender.balance + @amount
      receiver.balance = receiver.balance - @amount
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
