require 'pry'
class Transfer
  # code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount =amount
    @status = "pending"
  end

  def both_valid?
     sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && sender.balance > amount && @status=="pending"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      @status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if both_valid? && receiver.balance > amount && @status=="complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      @status = "reversed"
    end
  end


end
