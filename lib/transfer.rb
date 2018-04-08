class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance > @amount
  end

  def execute_transaction
    if valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
      sender.remove(amount)
      receiver.deposit(amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(amount)
      receiver.remove(amount)
      @status = "reversed"
    end
  end
end
