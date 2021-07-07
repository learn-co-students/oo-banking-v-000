require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @status != 'complete' && @amount <= @sender.balance
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = 'reversed'
    end
  end
end
