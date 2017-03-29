class Transfer
  attr_accessor :sender, :receiver, :amount, :status

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
    unless status == "complete"
      if both_valid? && sender.balance > amount
        sender.balance -= amount
        receiver.deposit(amount)
        @status = "complete"
      else
        reject_transfer
      end
    end
  end

  def reject_transfer
    if sender.valid? == false || sender.balance < amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end