require 'pry'
class Transfer

  attr_accessor :bank_account, :transfer, :sender, :status, :amount
  attr_reader :receiver

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
    if valid? && @status == "pending" && sender.balance > amount
    sender.balance -= amount
    receiver.balance += amount
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end
