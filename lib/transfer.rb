class Transfer

  attr_accessor :sender, :receiver, :amount, :status

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
    if valid? && amount < sender.balance && status == "pending"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount

      @status = "complete"

    else

      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    end

  end
def reverse_transfer
  if execute_transaction
  receiver.balance = receiver.balance - amount
  sender.balance = sender.balance + amount
  @status = "reversed"
else
  false
end
end
end
