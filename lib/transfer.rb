class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.status = 'pending'
    self.amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && self.sender.balance >= amount && self.status == 'pending'
      self.sender.withdraw(amount)
      self.receiver.deposit(amount)
      self.status = 'complete'
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if both_valid? && self.receiver.balance >= amount && self.status == 'complete'
      self.receiver.withdraw(amount)
      self.sender.deposit(amount)
      self.status = 'reversed'
    end
  end
end
