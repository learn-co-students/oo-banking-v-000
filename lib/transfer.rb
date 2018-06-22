class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance >= amount
  end

  def execute_transaction
    if !valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end
  end
end
