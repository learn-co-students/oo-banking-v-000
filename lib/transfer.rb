class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  @@sender = ""
  @@receiver = ""
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver= receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? and @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.valid? and @sender.balance >= @amount
      if @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      end
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
