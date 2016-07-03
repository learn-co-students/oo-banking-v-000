require "pry"
class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status


  def initialize(sender, receiver, amount)
    @amount = amount
    @receiver = receiver
    @sender = sender
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending" #you want to check if the sender has enough money in their account
      self.receiver.balance = self.receiver.balance + amount
      self.sender.balance = self.sender.balance - amount
      self.status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction || !execute_transaction
        @receiver.balance = @receiver.balance - amount
        @sender.balance = @sender.balance + amount
        @status = "reversed"
        # binding.pry
    end
  end

end
