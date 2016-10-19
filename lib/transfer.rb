class Transfer

  attr_accessor :status, :sender, :receiver, :amount
  

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
    if valid? && status != "complete" && @sender.balance >= @amount
      sender.debit(amount)
      receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    receiver.debit(amount) && sender.deposit(amount) unless @status != "complete"
    @status = "reversed"
  end
end
