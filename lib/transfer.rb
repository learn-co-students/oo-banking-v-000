class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def both_valid?
    ( sender.valid? && receiver.valid? ? true : false )
  end

  def execute_transaction
    if self.status == "complete"
      sender.balance
      receiver.balance
    elsif self.amount > sender.balance
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    else
      "No transaction was executed."
    end
  end
end