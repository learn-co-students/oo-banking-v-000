require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :last_transaction

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @last_transaction = 0
  end
  def valid?
    sender.valid? && receiver.valid?
  end
  def execute_transaction
      if self.valid? && self.status == "pending"
        if amount <= sender.balance
          sender.balance -= amount
          receiver.balance += amount
          @last_transaction = amount
          @status = "complete"
        else
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
      end
    end
  end
  def reverse_transfer
    if self.valid? && self.status == "complete"
      if last_transaction > 0
        receiver.balance -= last_transaction
        sender.balance += last_transaction
        @last_transaction = 0
        @status = "reversed"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end
end
