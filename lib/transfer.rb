class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    validity = nil
    (sender.valid? && receiver.valid?) ? validity = true : validity = false
    validity
  end

  def execute_transaction
    #transaction = nil
    if (self.valid? && status == 'pending' && sender.balance > amount)
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      self.reject_transaction
    end
    #transaction
  end

  def reject_transaction
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if status == 'complete'
      receiver.balance -= amount
      sender.balance += amount
      self.status = 'reversed'
    end
  end
end
