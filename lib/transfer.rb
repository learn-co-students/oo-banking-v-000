class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status=='pending' && self.sender.balance >= self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = 'complete'
    elsif self.sender.balance < self.amount
      self.status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = 'reversed'
    end
  end

end
