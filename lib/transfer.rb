class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
      @status = "pending"
      @sender = sender
      @receiver = receiver
      @amount = amount
  end
  def valid?
    if(@sender.valid? && @receiver.valid?)
      return true
    else
      return false
    end
  end
  def execute_transaction
    if !valid? || @sender.balance < amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    if @status != "complete"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    end
  end
  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end
end
