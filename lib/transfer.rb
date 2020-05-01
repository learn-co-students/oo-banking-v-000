class Transfer
  attr_accessor :sender, :receiver, :amount, :status


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
    # @sender.balance -= @amount
    # @receiver.balance += @amount
    # @status = "complete"
    # @status = "rejected"
    # "Transaction rejected. Please check your account balance."
    if valid? && sender.balance > amount && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if receiver.balance > amount && @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end
end
