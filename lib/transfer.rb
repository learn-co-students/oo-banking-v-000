class Transfer

  attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance < @amount
    @status ="rejected"
    "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      false
    else
      @receiver.deposit(amount)
      @sender.balance -= @amount
      @status = "complete"
    end
  end

def reverse_transfer
if @status == "complete"
  @receiver.balance -= @amount
  @sender.deposit(amount)
  @status = "reversed"
end
end
end
