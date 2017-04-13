require "pry"
class Transfer
  attr_accessor :transfer,:status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @Transfer = transfer
    @sender = sender
    @receiver = receiver
    @status= "pending"
    @amount = amount
  end

  def valid?
    return sender.valid? && receiver.valid? && sender.balance > self.amount
  end

  def execute_transaction

     if self.valid? && self.status == "pending"
       sender.balance = (sender.balance - amount)
       receiver.balance = (receiver.balance + amount)
          self.status= "complete"
    else
        self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance = (sender.balance + amount)
      receiver.balance = (receiver.balance - amount)
        self.status = "reversed"
      end
    end

end
