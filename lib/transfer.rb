class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :bankaccount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end
  def execute_transaction
    if self.valid? == true && self.status == "pending" && @sender.balance > self.amount
      @sender.balance = @sender.balance - self.amount
      @receiver.balance = @receiver.balance + self.amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
    def reverse_transfer
      if self.valid? && self.status == "complete"
        @sender.balance = @sender.balance + self.amount
        @receiver.balance = @receiver.balance - self.amount
        @status = "reversed"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

end
