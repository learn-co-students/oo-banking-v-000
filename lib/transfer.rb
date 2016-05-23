require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = transfer_amount.to_i
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status == "pending"
      if self.amount > sender.balance || !sender.valid?
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        self.sender.balance = self.sender.balance - self.amount
        self.receiver.balance = self.receiver.balance + self.amount
        self.status = "complete"
        self.status
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance = self.receiver.balance - self.amount
      self.sender.balance = self.sender.balance + self.amount
      self.status = "reversed"
    end
  end

end
