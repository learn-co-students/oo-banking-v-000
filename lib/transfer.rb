class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @count = 0
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true && @sender.balance > @amount
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && @count == 0
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
      @count += 1
    else
      reject_transfer
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end
end
