class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @@last_trans = {:amount => ""}

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? == true && @receiver.valid? == true
  end

  def execute_transaction
    if @status == "pending" && valid? == true
      if @sender.balance > @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
        @@last_trans[:amount] = @amount
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @@last_trans[:amount]
      @receiver.balance -= @@last_trans[:amount]
      @status = "reversed"
    end
  end

end
