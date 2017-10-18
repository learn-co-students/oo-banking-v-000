class Transfer

  attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true :false
  end

  def execute_transaction
    if self.valid? && @status == "pending" && @sender.balance >= amount
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

    def reverse_transfer
      if @status == "complete" && self.valid?
      @status = "reversed"
      @sender.balance += amount
      @receiver.balance -= amount
     end
   end
end
