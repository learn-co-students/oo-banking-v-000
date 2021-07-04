class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end

  def status
    @status
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      @sender.balance = @sender.balance -= @amount
      @receiver.balance = @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance = @sender.balance += @amount
      @receiver.balance = @receiver.balance -= @amount
      @status = "reversed"

    end
    # if that status is complete
    #   we want to just reverse what happened
    #   change standing to pending
  end

end
