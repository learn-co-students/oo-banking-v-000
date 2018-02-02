require 'pry'
class Transfer
  attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(sender,receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? == true && self.status == "pending" && sender.balance>amount
      receiver.balance = receiver.balance+amount
      sender.balance = sender.balance-amount
      self.status =  "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance = receiver.balance-amount
      sender.balance = sender.balance+amount
      self.status = "reversed"
    end
  end
end
