class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
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
    unless @status == "complete"
      if @sender.balance < @amount || @sender.valid? == false
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      end
    end
  end

  def reverse_transfer
    unless self.status != "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
