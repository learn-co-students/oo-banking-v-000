require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount, :status

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
    return "Transaction has already been completed" if @status == 'complete'
    if @sender.balance < @amount
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
    @sender.balance = @sender.balance - @amount
    @receiver.deposit(@amount)
    @status = 'complete'
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit(@amount)
      @receiver.balance = @receiver.balance - @amount
      @status = 'reversed'
    else
      return "Can only reverse completed transfers"
    end
  end

end
