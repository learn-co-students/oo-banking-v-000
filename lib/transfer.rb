require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :counter
  attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @counter = 1
  end

  def both_valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.valid? && sender.balance > amount
      while counter > 0
        receiver.deposit(amount)
        sender.balance -= amount
        self.status = "complete"
        self.counter -= 1
      end
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if counter == 0
      sender.deposit(amount)
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end