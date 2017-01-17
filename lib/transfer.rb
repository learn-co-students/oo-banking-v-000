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
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if !valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif status == "pending"
      receiver.deposit(amount)
      sender.deposit(amount * -1)
      self.status = "complete"
    end
    binding.pry
  end
end
