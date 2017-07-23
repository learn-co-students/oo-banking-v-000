class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
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
    if (@sender.balance >= @amount && @status == "pending")
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif @status != "pending"
      "Transaction already completed."
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      if (@receiver.balance >= @amount)
        @receiver.balance -= @amount
        @sender.balance += @amount
        @status = "reversed"
      end
    end
  end

end
