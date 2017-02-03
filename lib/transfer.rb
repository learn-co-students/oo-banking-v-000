require 'pry'

class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @transfer_times = 0
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    if @transfer_times == 0
      @sender.balance -= @amount
      @receiver.balance += @amount
      @transfer_times += 1
    end

    @status = "complete"
  end

  def reverse_transfer
    if @transfer_times == 1
      @receiver.balance -= @amount
      @sender.balance += @amount
      @transfer_times -= 1
    end
    @status = "reversed"
  end

end#class Transfer
