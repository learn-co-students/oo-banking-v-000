class Transfer
  # your code here!
attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && @sender.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
    end
    @status = "complete"

    if !sender.valid? || @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
    end
    @status = "reversed"
  end

end
