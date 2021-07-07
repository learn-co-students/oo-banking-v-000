class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      @status = "rejected"
    else
      #@sender.balance >= @amount
      @receiver.deposit(@amount)
      @sender.deposit(-@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(-@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
