require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, money)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = money
  end

  def valid?
    @sender.valid?
    @receiver.valid?
    #binding.pry
  end

  def execute_transaction
    if @sender.valid? && @receiver.valid? && @sender.balance >= @amount &&  @status != 'complete'
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = 'reversed'
    end
  end

end
