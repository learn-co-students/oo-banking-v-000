class Transfer
    attr_accessor :receiver, :sender, :amount, :status
  def initialize(sender,receiver,amount)
    @receiver = receiver
    @sender = sender
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    if @receiver.valid? and @sender.valid?
      true
      else
      false
    end
  end

  def execute_transaction
    if @sender.balance < @amount
        reject_transfer
    elsif @status == "pending" && @sender.balance > @amount

      @sender.balance-=@amount
      @receiver.balance+=@amount
      @status = "complete"
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance+=@amount
      @receiver.balance-=@amount
      @status = "reversed"
    end
  end

end
