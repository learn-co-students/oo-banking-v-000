class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
    @transfer = true
  end

  def execute_transaction
    if @status == "pending" && sender.balance > @amount
      receiver.balance +=amount
      sender.balance -=amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    else
      reject_transfer
    end
  end
end
