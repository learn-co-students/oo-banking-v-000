require 'pry'

class Transfer

  attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if valid? && sender.balance > amount && self.status == "pending"
      receiver.deposit(@amount)
      sender.balance -= @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > 0 && self.status == "complete"  
      sender.deposit(@amount)
      receiver.balance -= @amount
      self.status = "reversed"
    else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end

end
