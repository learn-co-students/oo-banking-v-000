require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  # your code here

  def valid?
    if sender && receiver
      true
    end
    sender.valid? && receiver.valid?
    # binding.pry
  end

  def execute_transaction
      sender.balance = sender.balance - amount
      sender.balance
      receiver.balance = receiver.balance + amount
      self.status = "complete"
      self.amount = 0
      if self.valid? == false
        "Transaction rejected. Please check your account balance."
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end


      # binding.pry
  end

end
