class Transfer
  # your code here
  attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && valid? && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
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
