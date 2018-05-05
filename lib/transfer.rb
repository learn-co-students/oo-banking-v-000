class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender,receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? && @sender.balance > @amount
      if @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
      end
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
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
