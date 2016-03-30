class Transfer
  attr_accessor :sender, :receiver, :amount, :status

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
    if (@status == "pending") && (both_valid? == true) && (sender.balance > amount)
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      reject_transfer
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reject_transfer
    @status = "rejected"
  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance -= @amount
      sender.balance += @amount
      @status = "reversed"
    end
  end


end