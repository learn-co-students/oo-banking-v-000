require 'pry'
class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
    @count = 0
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @count == 0 && sender.balance >= @amount
      sender.balance = sender.balance - @amount
      receiver.balance = receiver.balance + @amount
      @status = "complete"
      @count +=1

    else
      @status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @count == 1
    @status = "reversed"
    sender.balance = sender.balance + @amount
    receiver.balance = receiver.balance - @amount
   end 
  end

end
