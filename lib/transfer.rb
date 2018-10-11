class Transfer
  attr_reader :sender, :receiver, :amount, :sender_beginning_balance
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @sender_beginning_balance = @sender.balance
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def send
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  end

  def funds_available?
    @sender.balance >= @amount
  end

  def execute_transaction
    if @status == "pending" && funds_available?
      send
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = "reversed"
  end

  def reverse_transfer
     self.reverse if @status == "complete"
  end
end
