
class Transfer
  # your code here
  attr_accessor :amount, :status, :sender, :receiver

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
      @sender.balance -= amount
      @receiver.deposit(amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
