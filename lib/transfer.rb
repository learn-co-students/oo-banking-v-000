class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @receiver.valid? && @sender.valid?
  end

  def execute_transaction
    if self.status == 'pending' && valid? && sender.balance > amount
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = 'complete'
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = 'rejected'
    'Transaction rejected. Please check your account balance.'
  end

  def reverse_transfer
    if valid? && self.status == 'complete' && receiver.balance > amount
      receiver.balance -= @amount
      sender.balance += @amount
      self.status = 'reversed'
    else
      reject_transfer
    end
  end

end
