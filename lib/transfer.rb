class Transfer

  attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && @sender.balance > amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(@amount)
      receiver.balance -= @amount
      @status = "reversed"
    end
  end


end