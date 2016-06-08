class Transfer
  attr_accessor :receiver, :amount, :sender, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && sender.balance > amount && self.status == 'pending'
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if both_valid? && receiver.balance > amount && self.status == 'complete'
      receiver.balance -= amount
      sender.balance += amount
      self.status = 'reversed'
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = 'rejected'
    'Transaction rejected. Please check your account balance.'
  end


end
