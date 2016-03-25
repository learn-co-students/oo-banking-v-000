class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  
  require 'pry'
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
require 'pry'
 def both_valid?
    sender.valid? && receiver.valid? ? true : false
    # binding.pry
  end

  def execute_transaction
  if both_valid? && @status == "pending" && @sender.balance - @amount >= 0
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" 
      receiver.balance -= @amount
      sender.balance += @amount
      @status = "reversed"

    end


end