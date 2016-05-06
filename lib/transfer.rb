class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    reject_transfer
    if status == "pending"
      sender.deposit(0 - amount)
      receiver.deposit(amount)
      @status = "complete"
      else
      reject_transfer
    end
  end

  def reject_transfer
    if !sender.valid? || sender.balance - amount <= 0
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.deposit(amount)
      receiver.deposit(0 - amount)
      @status = "reversed"
    end
  end

end