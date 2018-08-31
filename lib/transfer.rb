require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    sender.valid? && receiver.valid?
  end
  def execute_transaction
      if self.valid? && sender.balance > amount && self.status == "pending"
          sender.balance -= amount
          receiver.balance += amount
          @status = "complete"
        else
        reject_transfer
    end
  end
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
        receiver.balance -= amount
        sender.balance += amount
        @status = "reversed"
      else
        reject_transfer
    end
  end
  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
