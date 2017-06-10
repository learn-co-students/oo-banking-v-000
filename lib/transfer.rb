require "pry"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
# binding.pry


    if @status == "pending" && @sender.class == BankAccount && @amount <= @sender.balance
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"

    elsif @status = "complete" || @sender.class != BankAccount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
  # your code here
end
