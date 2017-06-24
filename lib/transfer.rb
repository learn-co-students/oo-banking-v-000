require "pry"
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if @sender.valid? && @sender.balance >= @amount
      @receiver.balance += amount
      @sender.balance -= amount
      @old_amount = @amount
      @amount = 0
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    # binding.pry
    if @status == "complete"
      @receiver.balance -= @old_amount
      @sender.balance += @old_amount
      @status = "reversed"
    end
  end
end
