class Transfer
  attr_accessor :amount, :sender, :receiver
  attr_reader :status 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def both_valid?
    sender.valid? and receiver.valid?
  end

  def execute_transaction
    if both_valid? and sender.balance > amount and  @status == 'pending'
      sender.balance -= @amount
      receiver.balance += @amount
      @status = 'complete'
    else
      reject_transfer
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if receiver.balance > amount && @status == 'complete' && both_valid?
      sender.balance += amount
      receiver.balance -= amount
      @status = 'reversed'
    else
      reject_transfer
    end
  end
end
