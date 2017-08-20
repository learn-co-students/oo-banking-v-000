require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    binding.pry
    if @sender.valid? && @sender.balance >= @amount && @status == 'pending'
      @sender.deposit(-1 * @amount)
      @receiver.deposit(@amount)
      @status = 'complete'
    elsif !@sender.valid? || @sender.balance < @amount
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit(@amount)
      @receiver.deposit(-1 * @amount)
      @status = 'reversed'
    end
  end


end
