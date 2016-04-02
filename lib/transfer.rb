class Transfer

  attr_reader :sender
  attr_accessor :status

  def initialize( sender, recipient, transfer_amount )
    @sender = sender
    @recipient = recipient
    @transfer_amount = transfer_amount
    @status = 'pending'
  end

  def receiver
    @recipient
  end

  def amount
    @transfer_amount
  end

  def both_valid?
    self.sender.valid? && self.receiver.valid?
  end

  def valid_transaction?
    self.both_valid? && self.status != 'complete' && self.sender.balance > self.amount
  end

  def execute_transaction
    if self.valid_transaction?
      self.sender.withdraw(self.amount)
      self.receiver.deposit(self.amount)
      self.status = 'complete'
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    self.status = 'rejected'
    'Transaction rejected. Please check your account balance.'
  end

  def reverse_transfer
    if self.status == 'complete' && self.receiver.balance > self.amount
      self.receiver.withdraw(self.amount)
      self.sender.deposit(self.amount)
      self.status = 'reversed'
    else
      'Can\'t reverse transfer'
    end
  end

end
