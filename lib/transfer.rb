class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return true if sender.valid? && receiver.valid?
    return false
  end

  def execute_transaction
    if @amount > sender.balance
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    elsif @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance -= @amount
      sender.balance += @amount
      @status = "reversed"
  end
end 
end
