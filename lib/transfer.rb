require 'pry'
class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  
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
    if @sender.balance < amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @sender.balance >= amount && @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    end
  end
  
  def reverse_transfer
    if @receiver.balance >= amount && @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end
end
