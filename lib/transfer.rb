class Transfer
  attr_reader :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @transfer_count = 1
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @transfer_count > 0 && valid? && @sender.balance >= @amount
      @transfer_count -= 1
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @transfer_count += 1
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
 end
