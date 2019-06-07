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
      receiver.balance = receiver.balance + amount
      self.status = "complete"
  end

end
