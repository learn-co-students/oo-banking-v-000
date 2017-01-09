class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if status == "complete" || !valid? || amount > sender.balance
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end

  end

end
