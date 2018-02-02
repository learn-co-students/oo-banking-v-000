class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @count = 0
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @count == 0
      if @sender.balance > @amount
          @count += 1
          @sender.balance -= @amount
          @receiver.balance += @amount
          @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if count == 1
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
