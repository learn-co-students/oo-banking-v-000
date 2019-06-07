require 'pry'
# your code here
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if sender && receiver
      # true
    end
    sender.valid? && receiver.valid?
    # binding.pry
  end

  def execute_transaction
    @execute_transaction ||= if self.valid?
                          sender.balance = sender.balance - amount
                          receiver.balance = receiver.balance + amount
                          end
      self.status = "complete"
      if self.valid? == false
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
      # binding.pry
  end

  def reverse_transfer
    receiver.balance = receiver.balance - amount
    sender.balance = sender.balance + amount
    if self.execute_transaction
    end
    self.status = "reversed"
    # binding.pry
  end
end
