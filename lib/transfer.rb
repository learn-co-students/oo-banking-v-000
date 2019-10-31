class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @amount = amt
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.sender.valid? && @status == "pending" && self.sender.balance > @amount
      @sender.balance-=@amount
      @receiver.balance+=@amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance+=@amount
      @receiver.balance-=@amount
      @status = "reversed"
    
    end
  end
end
