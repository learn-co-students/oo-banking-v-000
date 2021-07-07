require 'pry'

class Transfer
  attr_accessor :status
  attr_reader   :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? && self.sender.balance > amount && self.status == "pending"
      self.receiver.deposit(amount)
      self.sender.withdraw(amount)
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if valid? && self.sender.balance > amount && self.status == "complete"
      # binding.pry
      self.sender.deposit(amount)
      self.receiver.withdraw(amount)
      self.status = "reversed"
    else
      reject_transfer
    end
  end
end
