require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    #sender account isn't reading as invalid
    if valid?
      if @status == 'pending'
        @sender.balance -= amount
        @receiver.balance += amount
        @status = 'complete'
      end
    else 
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end


  def reverse_transfer
    if @status == 'complete'
      @sender.balance += amount
      @receiver.balance -= amount
      @status = 'reversed'
    end
  end

end
