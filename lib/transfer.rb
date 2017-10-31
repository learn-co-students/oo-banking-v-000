class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @latest_transfer = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && (@sender.balance-@amount)>0
      if @status == "pending"
        @sender.balance -=@amount
        @receiver.balance +=@amount
        @latest_transfer = @amount
        @status = "complete"
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance +=@latest_transfer
      receiver.balance -=@latest_transfer
      @status = "reversed"
    end
  end
  # your code here
end
