require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status
   
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @sender = sender
    @status = 'pending'
    @amount = amount
  end

  def both_valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == 'complete'
      return nil
    end
    #binding.pry
    if !self.both_valid? || @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end

end