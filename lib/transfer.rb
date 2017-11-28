require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    #this amount shouldn't be initialized...
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && @sender.valid? && @sender.balance > @amount
      @sender.deposit(-50)
      @receiver.deposit(50)
      @status = "complete"
    elsif @sender.balance < @amount || @sender.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(50)
      @receiver.deposit(-50)
      @status = "reversed"
    end
  end

end
