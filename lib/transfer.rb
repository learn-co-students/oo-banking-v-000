class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    true if @sender.valid? & @receiver.valid?
  end

  def execute_transaction
    if self.both_valid? && @status == "pending" && amount < sender.balance
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      self.reject_transaction

    end
  end

  def reject_transaction
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    else
      nil
    end
  end
end

