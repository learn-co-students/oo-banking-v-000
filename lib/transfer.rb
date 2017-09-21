class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance >= amount
  end

  def reverse_valid?
    sender.valid? && receiver.valid? && receiver.balance >= amount
  end

  def execute_transaction
    if valid? && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && reverse_valid?
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    else
      "This did not work. Sorry."
    end
  end

end
