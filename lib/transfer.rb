class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @last_transfer_sent = 0

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if status != "complete"
      @sender.balance -= amount
      @receiver.balance += amount
      @last_transfer_sent = amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end

#for only happen once test, maybe make a check for if status == complete return reject message
