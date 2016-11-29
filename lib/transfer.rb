class Transfer

  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, amount)
   @sender = sender #amanda
   @receiver = receiver #avi
   @amount = amount #50
   @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid?
       self.sender.balance  = self.sender.balance - self.amount
      self.receiver.balance = self.receiver.balance + self.amount
    else
      "Transaction rejected. Please check your account balance."
    end
     self.status = "complete"
  end

end
