require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance >= self.amount
  end

  def execute_transaction
    if valid? && self.status == "pending"
        self.sender.withdraw(@amount)
        self.receiver.deposit(@amount)
        self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && self.status == "complete"
      self.sender.deposit(@amount)
      self.receiver.withdraw(@amount)
      self.status = "reversed"
    end
  end

end
