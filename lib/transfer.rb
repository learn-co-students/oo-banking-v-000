require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  attr_reader :counter

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @counter = 0
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    while @counter<1
    if @sender.valid? && @receiver.valid?
      @receiver.balance += @amount
      @receiver.balance
      @sender.balance -=@amount
      @sender.balance
      if @sender.balance <= 0
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else
        @status = "complete"
      end
      @counter+=1
    else
      @status = "rejected"
      @counter+=1
      return "Transaction rejected. Please check your account balance."
    end
    #@counter+=1
  end
  end

  def reverse_transfer
    if @status != "pending" && @status != "rejected"
      @receiver.balance -= @amount
      @receiver.balance
      @sender.balance += @amount
      @sender.balance
      @status = "reversed"
    else
    end
  end
end
