require 'pry'

class Transfer
  attr_accessor  :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
     if valid? && @sender.valid? && @sender.balance > amount && @status == "pending" && @status != "complete"
         @sender.balance = @sender.balance - @amount
         @receiver.balance = @receiver.balance + @amount
         @status = "complete"
       else
         @status = "rejected"
         "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    if valid? && @status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end

end
