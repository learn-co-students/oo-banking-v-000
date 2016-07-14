# Transfer Class
class Transfer
  attr_accessor :status, :last_sender, :last_receiver, :last_amount
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.sender.balance < self.amount
      self.status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    elsif status == 'pending'
      self.last_sender = self.sender
      self.last_receiver = self.receiver
      self.last_amount = self.amount
      self.sender.withdraw(self.amount)
      self.receiver.deposit(self.amount)
      self.status = 'complete'
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.last_sender.deposit(self.last_amount)
      self.last_receiver.withdraw(self.last_amount)
      self.status = 'reversed'
    end
  end
end
