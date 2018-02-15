class Transfer

attr_accessor :sender, :receiver, :status, :amount

  def initialize (sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount =  amount
    @status = status
  end

  def valid?
    (sender.valid? && receiver.valid?)? true:false
  end

  def execute_transaction
    if self.valid?
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
