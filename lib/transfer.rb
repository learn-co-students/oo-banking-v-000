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
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && status == 'pending'
      sender.balance -= amount
      receiver.deposit(amount)
      self.status = 'complete'
    else
      self.reject_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && status == 'complete'
      sender.deposit(amount)
      receiver.balance -= amount
      self.status = 'reversed'
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

end
