require 'pry'
class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    (self.sender.valid? && self.receiver.valid?) ? true : false
    self.sender.balance > amount ? true : false
  end

  def execute_transaction
    unless self.status == 'complete'
      sender.withdraw(amount)
      receiver.deposit(amount)
      self.status = 'complete'
    end
    unless self.valid?
      self.status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      sender.deposit(amount)
      receiver.withdraw(amount)
      self.status = 'reversed'
    end
  end

end
