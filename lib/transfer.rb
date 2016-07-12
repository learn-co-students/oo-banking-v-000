class Transfer

  attr_accessor :status
  attr_reader :amount, :receiver, :sender

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    self.status = 'pending'
  end

  def execute_transaction
    if self.valid? && sender.balance >= self.amount && self.status == 'pending'
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = 'complete'
    elsif !self.valid? || sender.balance < self.amount
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    elsif self.status != 'pending'
      "This transaction is no longer active."
    end
  end

  def reverse_transfer
    if self.valid? && self.status == 'complete'
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = 'reversed'
    elsif !self.valid?
      "Transaction rejected. Please check your account."
    elsif self.status != 'complete'
      "This transaction may not be reversed."
    end
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

end
