class Transfer
  # code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && both_valid? == true && @sender.balance > @amount
      @receiver.deposit(@amount)
      @sender.deposit(-@amount)
      @status = "complete"
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
    @status = "reversed"
    @receiver.deposit(-@amount)
    @sender.deposit(@amount)
    end
  end

end