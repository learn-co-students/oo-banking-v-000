require 'pry'

class Transfer
  
  attr_accessor :transfer, :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else 
      false
    end
  end

  def execute_transaction
    1.times do
    sender.balance = sender.balance - amount
    receiver.balance = receiver.balance + amount
    @status = "complete"
    end
  end

end
