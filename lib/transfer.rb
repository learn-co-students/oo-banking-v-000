require 'pry'

class Transfer

  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    if @receiver.valid?  && @sender.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    until @status != "pending"
      if  @amount > @sender.balance
            @status = "rejected"
            return "Transaction rejected. Please check your account balance."
      else
            @sender.balance = sender.balance - @amount
            @receiver.balance = receiver.balance + @amount
            @status = "complete"
      end
    end

  end


  def reverse_transfer
    if @status == "complete"
      @sender.balance = sender.balance + @amount
      @receiver.balance = receiver.balance - @amount
      @status = "reversed"
    end
  end
#binding.pry
end
