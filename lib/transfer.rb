class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid?
      receiver.deposit(@amount)
      sender.balance = sender.balance - @amount
      @amount = 0
      @status = "complete"
    else
       "Transaction rejected. Please check your account balance."
       @status = "rejected"
    end
  end

end
