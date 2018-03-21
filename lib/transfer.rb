class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @count = 0
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if count < 1 && sender.valid?
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      @status = "complete"
      @count += 1
    elsif !sender.valid? == false
      status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
