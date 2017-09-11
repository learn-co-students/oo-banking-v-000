class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && @status == "pending"
      receiver.balance += amount
      sender.balance -= amount
      @status = "complete"
    else
      @status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end
  end

end
