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
    if status == "pending" && both_valid? && sufficient_funds?
      sender.withdraw(amount)
      receiver.deposit(amount)
      update_status("complete")
    else
      reject_transfer
    end
  end

  def reject_transfer
    update_status("rejected")
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if status == "complete"
      sender.deposit(amount)
      receiver.withdraw(amount)
      update_status("reversed")
    end
  end

  def sufficient_funds?
    sender.balance > amount
  end

  def update_status(status)
    self.status = status
  end
end