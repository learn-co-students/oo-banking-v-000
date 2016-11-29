require 'pry'


class Transfer

  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, amount)
   @sender = sender #amanda
   @receiver = receiver #avi
   @amount = amount #50
   @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && self.status == "pending" && sender.balance > amount
       sender.balance -=  amount
       receiver.balance +=  amount
       self.status = "complete"
    else
       self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"

  end

end

end
