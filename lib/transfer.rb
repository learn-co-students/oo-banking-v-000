class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def bad_transfer
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status  == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      bad_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status  == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end
