class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    if sender.valid? && receiver.valid? && @status == "pending" && sender.balance > @amount
      true
    else false
    end
  end

  def execute_transaction
    if valid?
      @balance = sender.withdrawal(@amount)
      @balance = receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      @balance = sender.deposit(@amount)
      @balance = receiver.withdrawal(@amount)
      @status = "reversed"
    end
  end


end
