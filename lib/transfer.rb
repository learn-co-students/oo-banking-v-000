class Transfer
  attr_accessor :receiver, :status, :amount
  attr_reader :sender

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @status == "pending"
      if @sender.balance - @amount < 0
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
