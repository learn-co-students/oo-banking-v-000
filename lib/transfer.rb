require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount, :status

  @last_transaction = 0
  def initialize(sender, receiver, amount )
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
     if @sender.balance > @amount
        @sender.balance -= @amount
        @receiver.balance += @amount
        @last_transaction, @amount = @amount, 0
        @status = "complete"
     else
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
     end

  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @last_transaction
      @receiver.balance -= @last_transaction
      @status = "reversed"
    end
  end
end
